#!/bin/bash
# project euler #1
numbers=()
mult=()
for i in {1..999} ; do
	numbers[((i-1))]=$i
done
for i in {0..998} ; do
	alreadyIn=0
	if [[ $((${numbers[$i]}%3)) == 0 ]] ; then
        mult+=" ${numbers[$i]} "
	alreadyIn=1;
	fi
	if [[ $((${numbers[$i]}%5)) == 0 ]] && [[ $alreadyIn -eq 0 ]] ; then
		mult+=" ${numbers[$i]} "
	fi

done
echo ${mult[*]}
for i in ${mult[@]}; do
  let tot+=$i
done
echo Total of sums: $tot
