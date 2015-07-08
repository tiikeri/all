#!/bin/bash
set=$( < /dev/urandom env LC_CTYPE=C tr -dc 1-9 | head -c 4 | while read -n 1 x ; do printf "$x " ; done )

while [[ 0 == 0 ]] ; do
echo -n "Number set: $set"
echo "#ENTER EXPRESSION...#"
read expr
if [[ $expr == "q" ]] ; then
	exit 1
fi

result=$(echo "$expr" | bc)
if [[ $result == 24 ]] ; then
	echo Good job!
	exit 1
else
	echo "Sorry, that's $result . Try again or enter q to quit."
fi

done

