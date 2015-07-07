#!/usr/local/bin/bash
stock=$1
mkdir -p stocks-files
touch stocks-files/json.txt # create info.txt if missing
touch stocks-files/raw-json.txt # create raw-info.txt if missing
touch stocks-files/yahoo-json.txt
touch stocks-files/yahoo.txt
command -v jq >/dev/null 2>&1 || { echo >&2 "This program requires jq (A json interpreter.)"; exit 1; }
cd stocks-files 2> /dev/null
wget "http://www.google.com/finance/info?q=%3a$stock" -qO raw-json.txt # get the information from Google Finance and write it
wget "http://finance.yahoo.com/d/quotes.csv?s=$stock&amp;f=nkqwxyr1l9t5p4" -qO yahoo-json.txt #get the information
cat raw-json.txt | sed 's/[// []//g' > raw.json.txt
cat raw.json.txt | sed 's/[]]//g' > raw2.json.txt
jq ".[]" raw2.json.txt | sed 's/"//g' > json.txt
more_raw=$(cat yahoo-json.txt)
echo $( echo $more_raw | sed 's/,.*//' )  > yahoo.txt
stockName=$(cat yahoo.txt)

##########set stock variables############
stockID=$(sed '1q;d' < json.txt)	 #
stockTicker=$(sed '2q;d' < json.txt)	 #
stockCorp=$(sed '3q;d' < json.txt)	 #
stockPrice=$(sed '4q;d' < json.txt)	 #
lastUpdate=$(sed '8q;d' < json.txt)	 #
priceChange=$(sed '11q;d' < json.txt)	 #
percentChange=$(sed '13q;d' < json.txt) #
previousClose=$(sed '16q;d' < json.txt) #
ahPrice=$(sed '16q;d' < json.txt)	 #
ahLUpdate=$(sed '17q;d' < json.txt)	 #
ahPriceChange=$(sed '18q;d' < json.txt) #
ahPctChange=$(sed '19q;d' < json.txt)   #
#########################################
#ah color formatting
stock_char_count=${#stockTicker}
linecount=$(wc -l json.txt)
linecount=${linecount#?} #remove tab character from wc -l
linecount=${linecount%?????????} #remove info.txt from wc -l
if [[ $linecount -gt 20 ]] ; then
	if [[ ${ahPriceChange:0:1} == "+" ]] ; then ahPriceChange=${ahPriceChange#?} ; ahPriceChange=$(printf "\e[32m+$ahPriceChange\e[0m") ; fi
	if [[ ${ahPriceChange:0:1} == "-" ]] ; then ahPriceChange=${ahPriceChange#?} ; ahPriceChange=$(printf "\e[31m-$ahPriceChange\e[0m") ; fi
	if [[ ${ahPctChange:0:1} != "-" ]] ; then ahPctChange=$(printf "\e[32m+$ahPctChange%%\e[0m") ; fi
	if [[ ${ahPctChange:0:1} == "-" ]] ; then ahPctChange=${ahPctChange#?} ; ahPctChange=$(printf "\e[31m-$ahPctChange%%\e[0m") ; fi
	ah_trades_present="yes"
else
	ah_trades_present="no"
fi
#color formatting
if [[ ${priceChange:0:1} == "+" ]] ; then priceChange=${priceChange#?} ; priceChange=$(printf "\e[32m+$priceChange\e[0m") ; fi
if [[ ${priceChange:0:1} == "-" ]] ; then priceChange=${priceChange#?} ; priceChange=$(printf "\e[31m-$priceChange\e[0m") ; fi
if [[ ${percentChange:0:1} != "-" ]] ; then percentChange=$(printf "\e[32m+$percentChange%%\e[0m") ; fi
if [[ ${percentChange:0:1} == "-" ]] ; then percentChange=${percentChange#?} ; percentChange=$(printf "\e[31m-$percentChange%%\e[0m") ; fi
#text formatting
stockName=$(echo "$stockName" | tr '"' ' ')
if [[ $ah_trades_present == "no" ]] ; then
echo    "Google Finance ID:    $stockID                      		"
echo    "Stock                 $stockTicker ($stockCorp) -$stockName    "
echo    "Price                 $stockPrice                  		"
echo    "Change:               $priceChange [$percentChange] 		"
echo    "Previous Close:       $previousClose                		"
echo    "Last Update:          $lastUpdate  		     		"
fi
if [[ $ah_trades_present == "yes" ]] ; then
echo 	"#################### AFTER HOURS ###################		"
echo    "Google Finance ID:    $stockID                      		"
echo    "Stock                 $stockTicker ($stockCorp) -$stockName   "
echo	"Price:                $ahPrice        		     		"
echo 	"Change:               $ahPriceChange [$ahPctChange]		"
echo	"Last Update:          $ahLUpdate		     		"
echo    "Previous Close:       $stockPrice		     		"
echo "$stock_description"
fi

