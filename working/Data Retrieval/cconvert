#!/bin/bash
formatted=$(echo "$2$3")
trade=$formatted
mkdir -p cconvert-files
cd cconvert-files
touch rate.txt # create info.txt if missing
touch raw.txt # create raw-info.txt if missing
echo $( wget http://www.google.com/finance/info?q=CURRENCY%3a$trade -q -O -) > raw.txt # get the information from Google Finance and write it to info.txt
tr "\" ," "\n" < raw.txt > rate.txt # split the information from Google Finance into separate lines
##########set exchng variables############
exchange=$(sed '16q;d' < rate.txt)	 #
exchRate=$(sed '32q;d' < rate.txt) 	 #
lastUpdate=$(sed '81q;d' < rate.txt)     #
priceChange=$(sed '89q;d' < rate.txt)    #
percentChange=$(sed '105q;d' < rate.txt) #
##########################################
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
