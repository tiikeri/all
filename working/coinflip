#!/bin/bash
if [[ $TERM != "xterm-256color" ]] ; then #check if the terminal is 256-color.
echo "This program requires xterm-256color. Use coin2-nocolor instead."
exit 1
else
	cat /dev/null > out.txt #reset out.txt
resetcolor() { #reset the color
	echo -ne "\e[0m"
}
color() { #function to set color
	resetcolor
	if [ $# -eq 1 ] ; then echo -ne "\033[38;5;${1}m"
	elif  [ $2 == "b" ]
		then
	echo -ne "\033[1;38;5;${1}m"
	
	fi
}

prob() { #calculate experimental probabilities
	x=$(echo "scale=4;($1/$c)" | bc)
	y=$(echo "scale=2;$x*100" | bc)
	echo "${y%??}%"
}
readmessage() { #if arguments are not entered, read a number entered by a user
	if [ $# -eq 1 ] ; then c=$1 && echo "Flipping coins..."
	else
		echo "Enter number of coins to flip..." ; read c ; echo "Flipping coins..."
	fi
}
flip() { #flip coins
	< /dev/urandom LC_CTYPE=C gtr -dc HT | head -c $c | while read -n 1 ccoin
		do
	case $ccoin in
	H)
	color 047
	echo -n "$ccoin" ; echo "$ccoin" >> out.txt ; sleep 0.0005
	;;
	T)
	color 255
	echo -n "$ccoin" ; echo "$ccoin" >> out.txt ; sleep 0.0005
	;;
	esac
	done
	echo -e "\n"
}
sorting() {
	echo "Sorting..."
	co=$( < out.txt )
	h=`grep -o "H" <<<"$co" | wc -l`
	t=`grep -o "T" <<<"$co" | wc -l`
	echo " "
}

stats() { #experimental functions
	if (($c<5))
		then
	exit 1
	else
		co=$( < out.txt )
	color 035
	echo "Heads:"
	h=`grep -o "H" <<<"$co" | wc -l`
	color 047 b
	echo $h
	resetcolor
	color 250
	echo "Tails:"
	color 255 b
	t=`grep -o "T" <<<"$co" | wc -l`
	echo $t
	color 196 b
	echo " "
	if [[ $# == 1 ]] ; then
	echo "Experimental probability"
	echo "Heads:"
	prob $h
	echo "Tails:"
	prob $t
	else
		exit 1
	fi
	fi
}
###
readmessage $1
flip
sorting
if [[ $2 == "e" ]] || [[ $1 == "e" ]] ; then
stats e
else
	stats
fi
###
fi
