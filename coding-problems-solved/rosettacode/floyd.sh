#!/bin/bash
n=$1
i=1
z=1
x=1
for ((i=1; i<=n; i++))
do
	for ((z=1; z<=i; z++))
	do
		printf "$x	"
		((x++))
		
	done
	echo ""
done
