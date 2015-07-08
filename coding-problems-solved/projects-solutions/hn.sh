#!/bin/bash
str=$1
count=0
te=0
fe=0
fve=0
array=()
lastnine=()
definedloop=(4 16 37 58 59 145 42)
if [[ ${#str} == 1 ]] ; then str="0$str" ; fi
math(){ 
	echo "$1" | bc
}
	while [[ $str != 1 ]] 
	do
				if [[ $(echo "${array[*]}") == *"41637588914542204" ]] ; then
			echo "This is not a happy number. (Loop detected.)"
			exit 1
		fi
		if [[ ${#str} == 1 ]] ; then str="0$str" ; fi
			i=0
			split=()
			while [[ $i -lt ${#str} ]]
		       	do 
				split+=(${str:$i:1})
		      	 	i=$((i+1))
		       	done
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

