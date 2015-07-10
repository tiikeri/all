#!/bin/bash
# project euler #1
numbers=()                    #create the array for all the numbers
mult=()                       #create an array for the multiples
for i in {1..999} ; do         #set up the numbers array
	numbers[((i-1))]=$i
done
for i in {0..998} ; do
	alreadyIn=0                                   #set a variable to ensure the number was not already put into the array
	if [[ $((${numbers[$i]}%3)) == 0 ]] ; then    #check if it is a multiple of three
        mult+=" ${numbers[$i]} "                #add it to the array
	alreadyIn=1;                                  #signify that the number has been added
	fi
	if [[ $((${numbers[$i]}%5)) == 0 ]] && [[ $alreadyIn -eq 0 ]] ; then #check if the number is a multiple of five and hasn't already been added
		mult+=" ${numbers[$i]} "                                           #add it to the array
	fi
done
echo ${mult[*]}           #display the multiples
for i in ${mult[@]}; do   #add them together
  let tot+=$i
done
echo Sum: $tot             #display the sum
exit 1
