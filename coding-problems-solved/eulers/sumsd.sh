#!/bin/bash
# project euler #6
numbers=()
squared=()
sumOf=()

for i in {1..100} ; do
	numbers[((i-1))]=$i
done
for i in {0..99} ; do
	   x=${numbers[$i]}
	   x=$(($x*$x))
	   squared+=" $x "
		   
done
echo ${squared[*]}
for i in ${squared[@]}; do
  let sumOf+=$i
done
for i in ${numbers[@]}; do
  let sumOfN+=$i
done

echo Total of sums: $sumOf
sumSquared=$(($sumOfN*$sumOfN))
echo Sum squared: $sumSquared
echo Difference: $(($sumSquared-$sumOf))
