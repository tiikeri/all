#!/bin/bash
# ccoinp.sh: get crypto-coin prices, courtesy of the vircurex api
# requires jq. (sudo apt-get jq) (brew install jq)
command -v jq >/dev/null 2>&1 || { echo >&2 "This program requires jq (A json interpreter.)"; exit 1; }
touch json.txt
touch data.txt
fiat_1=$1
fiat_2=$2
wget "https://api.vircurex.com/api/get_info_for_1_currency.json?base=$1&alt=$2" -qO json.txt
jq ".[]" json.txt | sed 's/[:|"]//g' > data.txt
readLine(){
	sed "$1q;d" < data.txt
}
##########################
exchangeName="$1/$2"
last=`readLine 0`
priceHigh=`readLine 3` 
priceLow=`readLine 4`
priceAvg=`readLine 5`
tradeBuy=`readLine 0`
tradeSell=`readLine 0`
volumeCoin1=`readLine 6`
volumeCoin2=`readLine 0`
percentChange=`readLine 0`
##########################
! if [[ $last < $priceAvg ]] ; then lastTrade=$(printf "\e[31m$lastTrade\e[0m") ; fi
! if [[ $last > $priceAvg ]] ; then lastTrade=$(printf "\e[32m$lastTrade\e[0m") ; fi
if [[ ${percentChange:0:1} != "-" ]] ; then percentChange=$(printf "\e[32m+$percentChange%%\e[0m") ; fi
if [[ ${percentChange:0:1} == "-" ]] ; then percentChange=${percentChange#?} ; percentChange=$(printf "\e[31m-$percentChange%%\e[0m") ; fi
priceHigh=$(printf "\e[32m$priceHigh\e[0m")
priceLow=$(printf "\e[31m$priceLow\e[0m")
volumeCoin1=$(printf "%'.3f\n" $volumeCoin1)
volumeCoin2=$(printf "%'.3f\n" $volumeCoin2)
echo "LAST TRADE           $priceAvg   "
echo "HIGH                 $priceHigh  "
echo "LOW                  $priceLow   "
echo "VOLUME ($1)	     $volumeCoin1" | sed ':a;s/\B[0-9]\{3\}\>/,&/;ta' 
