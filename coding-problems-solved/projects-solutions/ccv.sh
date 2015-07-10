#!/bin/bash
checkprovider(){
	str=$1                    #grab the string
	fdig=$(echo ${str:0:1})   #pull the first digit to check provider of card
	case "$fdig" in
	4)
	provider="Visa"
	;;
	5)
	provider="Mastercard"
	;;
	6)
	provider="Discover"
	;;
	3)
	provider="American Express"
	;;
	*)
	provider="Unknown Provider"
	esac
	echo "Entered CC number: $str"            #display number 
	echo "Entered CC's provider: $provider"   #display provider
}
getchecknumber(){ # get the last digit of the cc number
	str=$1
	checknum=$(echo ${str: -1})
	echo $checknum
}
getrest(){ # get the rest of the numbers in the sequence
	str=$(echo ${str%?})
}
doubleeveryother(){ # double every other number
	# split characters into an array
	arr=()
	i=0
	while [ "$i" -lt "${#str}" ]; do
	arr+=(${str:$i:1})
	i=$((i+1))
	done
	for ((i=1; i<=15; i++))
	do {
		char=$(echo "$i-1" | bc)
		double=$(echo "${arr[$char]} * 2" | bc)
		if [ $(($i%2)) -eq 0 ] ; then
		printf "${arr[$char]} "
		else
			arr[$char]=$double #replace the number in the array
		echo -n "$double "
		fi
	}
	done
	echo -e
}
adddigitsum() { #split a two digit number into two numbers and add them
	for ((a=0; a<=14; a++))
	do {
		
		NUMSPLIT=()
		number=$(echo ${arr[$a]})
		if [[ ${#number} == 2 ]] ; then
		i=0
		while [[ "$i" -lt ${#number} ]]; do
		NUMSPLIT+=(${number:$i:1})
		i=$((i+1))
		done
		num=$((${NUMSPLIT[0]} + ${NUMSPLIT[1]}))
		addeddigit=$( echo $num | bc )
		arr[$a]=$addeddigit # replace the number in the array
		echo -n "$addeddigit "
		fi
	}
	done
}
addall(){ #add all the digits
	sum=$( IFS="+"; bc <<< "${arr[*]}" )
	echo -e "$sum"
}
multiply(){ #multiply by 9
	result=$( echo "$sum * 9" | bc )
	echo $result
}
validate(){ #see if the last number of 'result' is equal to the checknum
	resultchecknum=$(echo ${result: -1})
	if [[ $resultchecknum == $checknum ]] ; then
	echo "$checknum  =  $resultchecknum"
	echo "CC Number is valid!"
	else
		echo "$checknum  ≠ $resultchecknum"
	echo "CC Number is not valid."
	fi
}
checkprovider $1
echo -e
echo "Getting check number..."
getchecknumber $1
echo "Getting the rest of the sequence..."
getrest
echo "Doubling every other number..."
doubleeveryother
echo "Adding two digit sums..."
adddigitsum
echo -e "\nGetting sums..."
addall
echo "Multiplying..."
multiply
echo "Validating..."
validate
