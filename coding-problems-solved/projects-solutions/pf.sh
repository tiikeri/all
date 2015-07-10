#!/bin/bash
primenumber()
{
primenum=$1
  for ((counter2=2;$((counter2*counter2))<=$primenum;counter2++))
    do
      if [ $((primenum%counter2)) -eq 0 ]
      then
        return 1
      fi
    done
  return 0
}
primefind()
{
  primenumber $1 && echo "$1" && exit 0
   for ((counter1=$2;counter1<=$1;counter1++))
    do
      primenumber $counter1 && factorcheck $1 $counter1 &&  break
   done
}
factorcheck()
{
  prime=$2
  newnum=$1
  remainder=$((newnum%prime))
   if [ $remainder -eq 0 ]
   then
      printf "%dx" $prime
      newnum=$((newnum/prime))
      primefind $newnum 2
      return
  else
  let prime++
  primefind $newnum $prime
fi
}
echo "Prime Factors of $1:"
primefind $1 2
printf "\b \n"                   
