#!/bin/bash
trade=$1
mkdir -p crc-files
cd crc-files

echo $( wget http://www.google.com/finance/info?q=CURRENCY%3a$trade -q -O -) > raw-json.txt # get the information from Google Finance and write it to info.txt
cat raw-json.txt | sed 's/[// []//g' > raw.json.txt
cat raw.json.txt | sed 's/[]]//g' > raw2.json.txt
jq ".[]" raw2.json.txt | sed 's/["]//g' > json.txt
##########set exchng variables############
exchange=$(sed '2q;d' < json.txt)	 #
exchRate=$(sed '4q;d' < json.txt) 	 #
lastUpdate=$(sed '10q;d' < json.txt)  #
priceChange=$(sed '11q;d' < json.txt)  #
percentChange=$(sed '13q;d' < json.txt) #
##############################################
#color formatting
if [[ ${priceChange:0:1} == "+" ]] ; then priceChange=${priceChange#?} ; priceChange=$(printf "\e[32m+$priceChange\e[0m") ; fi
if [[ ${priceChange:0:1} == "-" ]] ; then priceChange=${priceChange#?} ; priceChange=$(printf "\e[31m-$priceChange\e[0m") ; fi
if [[ ${percentChange:0:1} != "-" ]] ; then percentChange=$(printf "\e[32m+$percentChange%%\e[0m") ; fi
if [[ ${percentChange:0:1} == "-" ]] ; then percentChange=${percentChange#?} ; percentChange=$(printf "\e[31m-$percentChange%%\e[0m") ; fi
lastUpdate=$(echo $lastUpdate | tr '[TZ]' ' ')
echo    "Exchange              $exchange                     "
echo    "Price                 $exchRate                     "
echo    "Change                $priceChange [$percentChange] "
echo    "Last Update           $lastUpdate GMT		     "


