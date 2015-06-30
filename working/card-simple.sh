#!/bin/bash
cat /dev/null > out.txt	
z=$( < out.txt)
for (( y=1; y<=$1; y++ ))
  do	
  	  < /dev/urandom LC_CTYPE=C tr -dc HDCS | head -c 1 | while read -n 1 s  
do
        case $s in
	D)
		printf '  \e[0;31;47m ♦ '
		;;
	H)
                printf '  \e[0;31;47m ♥'
       		;;
	S)
		printf '  \e[0;30;47m ♠'
		;;
	C)
		printf '  \e[0;31;47m ♣'
		;;
esac


done
	< /dev/urandom LC_CTYPE=C tr -dc "1""2""3""4""5""6""7""8""9""10""J""Q""K""A" | head -c 1 | while read -n 1 n
do	
		if [ $n = "0" ]
	then
		echo -n '10 '
		echo -n '10 ' >> out.txt

        else
		echo -n "$n "
		echo -n "$n " >> out.txt

		fi

done
printf '\e[0m'
  done
  printf "\n"

