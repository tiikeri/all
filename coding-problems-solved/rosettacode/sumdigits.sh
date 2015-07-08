#!/bin/bash
chars=${#1}
str=$1
nums=()
for ((i=0; i<$chars; i++)) ; do
       nums+=" ${str:$i:1} "
done
tot=0
for i in ${nums[@]}; do
  let tot+=$i
done
echo "Total: $tot"
