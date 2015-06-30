#!/bin/bash
# calculate the number of possibilities
gen(){
	printf "%d^${2##*[!0-9]*}\n"  "$(($(
	export  LC_ALL=C; a=$1
	while   x=${a%"${a#?}"} s=
	case  $a     in
	([a-z]-["$x"-z]*|[A-Z]-["$x"-Z]*)
	a=${a#??} s=?
	printf  '(%d-%d+1)+' "'$a" "'$x";;
	([0-9]-["$x"-9]*)
	x=${a%"${a#???}"} a=${a#"$x"}
	printf  "$((-($x)+1))+";;
	(?-*)   a=${a#??}
	echo 2+;;
	(?*)    x=${a%%[A-Za-z0-9]-*}
	a=${a#"$x"}
	echo "${#x}+";;
	(*) !   echo 0          ;;esac
	do              a=${a#$s}       ; done
	)))"    |       bc|     sed 's/$/ possibilities./
	/^1 /s/....$/y./'
}
############################################################
#main script
gen $@ #display possibilities
#only generate one
if [ $# == 2 ] ; then
< /dev/urandom env LC_CTYPE=C tr -dc $1 | head -c $2 | while read -n 1 x
	do
printf "\e[1;36m$x"
sleep 0.03
done
echo -e '\033[0m'
exit 0
exit 1
elif [ $# == 3 ]
	then
#generate as many as $3 specifies
if [[ $3>4 ]]
	then
for (( b=1; b<=$3; b++ ))
do {
	if (( $(( $b % 6 )) == 0 ))
		then
	echo -e
	
	fi
	
	
	< /dev/urandom env LC_CTYPE=C tr -dc $1 | head -c $2 | while read -n 1 x
		do
	printf "$x"
	sleep 0.03
	done
	echo -ne ' '
	
	
	
}
done

elif [[ $3<=4 ]]
	then
for (( c=1; c<=$3; c++ ))
do {
	< /dev/urandom env LC_CTYPE=C tr -dc $1 | head -c $2 | while read -n 1 x
		do
	printf "$x"
	if (( $3>=10 ))
		then
	sleep 0.0005
	else
		sleep 0.003
	fi
	done
	echo -ne ' '
}
done
fi
fi
echo -e '\n'

