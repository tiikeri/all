#!/bin/bash
str=$1      #grab the string
count=0     #reset variables
te=0
fe=0
fve=0
array=()    #set an array so the program can check
#4 16 37 58 59 145 42# #the defined loop sequence for happy numbers, used as reference when making the code
if [[ ${#str} == 1 ]] ; then str="0$str" ; fi
math(){ 
	echo "$1" | bc #shortcut for bc
}
while [[ $str != 1 ]] #loops until the result is 1 (which means it's a happy number.)
  do
				if [[ $(echo "${array[*]}") == *"41637588914542204" ]] ; then #check if the sequence will loop
			echo "This is not a happy number. (Loop detected.)"
			exit 1
		fi
		if [[ ${#str} == 1 ]] ; then str="0$str" ; fi #manipulate x into 0x to make it have two digits
			i=0
			split=() #create an array for splitting digits up
			while [[ $i -lt ${#str} ]] 
		       	do 
				split+=(${str:$i:1}) #split digits
		      	 	i=$((i+1))
		       	done
            ###math###
			a="${split[0]}" 
			b="${split[1]}"
			te=0; fe=0; fve=0;
		       	if ((${#str}>=3)) ; then c="${split[2]}" ; te=1 ; fi 
			if ((${#str}>=4)) ; then d="${split[3]}" ; fe=1; te=0; fve=0;  fi 
			if ((${#str}>=5)) ; then e="${split[4]}" ; fve=1; fe=0; te=0;  fi 
			a=$(math "$a^2") 
			b=$(math "$b^2")
			if [[ $te == 1 ]] ; then c=$(math "$c^2") ; str=$(math "$a+$b+$c") ; stt="$a^2 + $b^2 + $c^2 = " ; fi
			if [[ $fe == 1 ]] ; then d=$(math "$d^2") ; str=$(math "$a+$b+$c+$d") ; stt="$a^2 + $b^2 + $c^2 + $d^2 = " ; fi
			if [[ $fve == 1 ]] ; then e=$(math "$e^2") ; str=$(math "$a+$b+$c+$d") ; stt="$a^2 + $b^2 + $c^2 + $d^2 + $e^2 = " ; fi
			if [[ $fe == 0 ]] && [[ $te == 0 ]] && [[ $te == 0 ]]  ; then str=$(math "$a+$b") ; stt="$a^2 + $b^2 = " ; fi
			array+="$str"
			count=$(math "$count+1")
			printf "$stt$str                            \r"
		done
	echo "It's a happy number."

