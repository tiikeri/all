#!/bin/bash
exp_one=$(echo "$1" | bc)
exp_two=$(echo "$2" | bc)
difference=$(echo "$exp_one-$exp_two" | bc)
if [[ ${difference:0:1} == "-" ]] ; then difference="+-${difference#?}" ; else difference="+-$difference" ; fi
echo Difference: $difference


