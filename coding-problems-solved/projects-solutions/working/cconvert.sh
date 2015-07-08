#!/bin/bash
formatted=$(echo "$2$3")
trade=$formatted
mkdir -p cconvert-files
cd cconvert-files
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
echo "Converting..."
sym(){
	case $1 in 
		EUR)
			echo "€"
			;;
		JPY|CNY)
			echo "¥"
			;;
		GBP)
			echo "£"
			;;
		CAD|AUD|USD|SGD|HKD|COP|NZD)
			echo "$"
			;;
		SEK|NOK|EEK|DKK)
			echo "kr"
			;;
		RUB)
			echo "руб"
			;;
		INR)
			echo "₹"
			;;

	esac	
}

sym1=`sym $2`
sym2=`sym $3`
amountOf=$1
convertedAmount=$(echo "scale=2;$amountOf * $exchRate" | bc)

echo "$sym1$1 [$2] ~ $sym2$convertedAmount [$3]"
echo "$exchRate per 1 $2"
