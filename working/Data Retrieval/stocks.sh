#!/usr/local/bin/bash
stock=$1
mkdir -p stocks-files
touch stocks-files/info.txt # create info.txt if missing
touch stocks-files/raw-info.txt # create raw-info.txt if missing
touch stocks-files/more-raw.txt
cd stocks-files 2> /dev/null
echo $( wget http://www.google.com/finance/info?q=%3a$stock -q -O -) > raw-info.txt # get the information from Google Finance and write it to info.txt
wget -q "http://finance.yahoo.com/d/quotes.csv?s=$stock&amp;f=nkqwxyr1l9t5p4" -O more-raw.txt
more_raw=$(cat more-raw.txt)
echo $( echo $more_raw | sed 's/,.*//' )  > more-raw.txt
stockName=$(cat more-raw.txt)
tr "\" ," "\n" < raw-info.txt > info.txt # split the information from Google Finance into separate lines
##########set stock variables############
stockID=$(sed '8q;d' < info.txt)	 #
stockTicker=$(sed '16q;d' < info.txt)	 #
stockCorp=$(sed '24q;d' < info.txt)	 #
stockPrice=$(sed '48q;d' < info.txt)	 #
lastUpdate=$(sed '73q;d' < info.txt)	 #
priceChange=$(sed '90q;d' < info.txt)	 #
percentChange=$(sed '106q;d' < info.txt) #
previousClose=$(sed '130q;d' < info.txt) #
ahPrice=$(sed '151q;d' < info.txt)	 #
ahLUpdate=$(sed '162q;d' < info.txt)	 #
ahPriceChange=$(sed '171q;d' < info.txt) #
ahPctChange=$(sed '187q;d' < info.txt)   #
#########################################
#ah color formatting
stock_char_count=${#stockTicker}
linecount=$(wc -l info.txt)
linecount=${linecount#?} #remove tab character from wc -l
linecount=${linecount%?????????} #remove info.txt from wc -l
if [[ $linecount -gt 150 ]] ; then
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

