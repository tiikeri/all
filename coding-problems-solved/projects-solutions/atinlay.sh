#!/bin/bash
ord_way=$1
first_letter=${ord_way:0:1}
other_lettercount=$(echo "${#ord_way} - 1" | bc)
other_letters=${ord_way:1:$other_lettercount}
case $first_letter in
	a|e|i|o|u)
		echo -e "${ord_way}yay"
		exit 1
		;;
	*)
	echo -e "$other_letters${ord_way:0:1}ay"
esac