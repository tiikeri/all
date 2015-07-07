#!/bin/bash
trade=$1
mkdir -p crc-files
cd crc-files
touch currency.txt # create info.txt if missing
touch raw-currency.txt # create raw-info.txt if missing
echo $( wget http://www.google.com/finance/info?q=CURRENCY%3a$trade -q -O -) > raw-currency.txt # get the information from Google Finance and write it to info.txt
tr "\" ," "\n" < raw-currency.txt > currency.txt # split the information from Google Finance into separate lines
##########set exchng variables############
exchange=$(sed '16q;d' < currency.txt)	 #
exchRate=$(sed '32q;d' < currency.txt) 	 #
lastUpdate=$(sed '81q;d' < currency.txt)  #
priceChange=$(sed '89q;d' < currency.txt)  #
percentChange=$(sed '105q;d' < currency.txt) #
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


