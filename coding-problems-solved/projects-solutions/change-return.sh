#!/bin/bash -   
#title          :change-return
#description    :returns the amount of change given for an amount of money
#author         :Viktor Ahlström
#date           :20150627
#version        :1.0    
#usage          :./change-return <dollars> [cents]
#notes          :       
#bash_version   :3.2.48(1)-release
#===========================================================================
_err()( unset   parm    msg     IFS     \
"${1##*[!_[:alnum:]]*}" || exit
parm=$1 IFS=$2  msg=$3; shift   3
eval ': "${'"$parm?\"'\$*' can't be right. \$msg"'"}"'
)
_chg()  if      set -- "${1#"${1%%[!0]*}"}.${2%"${2#??}"}${3+.}" "$@"

then    set     "${1##*.}" "$((q=(${1%%.*}0*4)/10+(d=(n=(p=0)))))"
while   set     "${1#0?}" "${1#?}"
shift   "$((!${#1}))"
[ "${1:-0}" -gt 0 ]
do      case    $1 in   ([3-9]?|2[5-9])
set "$(($1%25))" "$((q+=$1/25))";;
(??)    set "$(($1%10))" "$((d=$1/10))" ;;
(?)     set "" "$((p=$1-(5*(n=$1>=5))))";;
esac;   done
set     quarter q dime d nickel n penny p
echo    Your change is:
while   [ "$#" -gt 1 ]
	do      printf "\t$1 coins:\t$(($2))\n"
shift   2
done;   fi
if [[ $# == 2 ]] ; then _chg $1 $2
elif [[ $# == 1 ]] ; then _chg $1 00
else {
	echo "Enter dollars."
	read dollars
	echo "Enter cents."
	read cents
	_chg $dollars $cents
}
fi
