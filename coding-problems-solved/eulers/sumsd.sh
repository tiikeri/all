#!/bin/bash
# project euler #6
numbers=()                                        #make an array for the numbers
squared=()                                        #make an array for the numbers squared
sumOf=()                                          #make an array for the sum of all the numbers

for i in {1..100} ; do                            #set up the array for the numbers
	numbers[((i-1))]=$i
done
for i in {0..99} ; do                             #set up the array for the numbers squared
	   x=${numbers[$i]}
	   x=$(($x*$x))
	   squared+=" $x "
		   
done
echo ${squared[*]}                                #display all of the numbers squared
for i in ${squared[@]}; do                        #add all of the numbers squared together
  let sumOf+=$i                                   
done
for i in ${numbers[@]}; do                        #add all of the regular numbers together
  let sumOfN+=$i
done

echo Sum of 1^2..100^2: $sumOf                        #display the first sum
sumSquared=$(($sumOfN*$sumOfN))                       #calculate sum squared
echo Sum of 1..100 squared: $sumSquared               #display sum squred
echo Difference: $(($sumSquared-$sumOf))              #display the difference
