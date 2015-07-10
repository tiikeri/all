#!/bin/bash
ord_way=$1                                          #grab the string for manipulation
first_letter=${ord_way:0:1}                         #pull the first letter of the string
other_lettercount=$(echo "${#ord_way} - 1" | bc)    #check how many letters are left
other_letters=${ord_way:1:$other_lettercount}       #pull the other letters of the string
case $first_letter in
	a|e|i|o|u)                                        #check if the first letter is a vowel for using "yay"
		echo -e "${ord_way}yay"
		exit 1
		;;
	*)                                                #else use standard pig latin
	echo -e "$other_letters${ord_way:0:1}ay"
esac
