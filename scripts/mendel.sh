#!/bin/bash
echo "Enter father's gene. (1 for AA, 2 for Aa, 3 for aa)"
read father
echo "Enter mother's gene. (1 for AA, 2 for Aa, 3 for aa)"
read mother
combined="$father$mother"
case $combined in
	11)
		echo "Breakdown:"
		echo "AA	100%"
		echo "Aa	  0%"
		echo "aa	  0%"
		echo ""
		echo "Out of all four offspring, all of them will have the alleles AA."
		;;
	12|21)
		echo "Breakdown:"
		echo "AA	 50%"
		echo "Aa	 50%"
		echo "aa	  0%"
		echo "Out of all four offspring, two of them will have the alleles AA, and the other two will have Aa."
		;;
	13|31)
		echo "Breakdown:"
		echo "AA	  0%"
		echo "Aa	100%"
		echo "aa	  0%"
		echo "Out of all four offspring, all of them will have the alleles Aa."
		;;
	23|32)
		echo "Breakdown:"
		echo "AA	  0%"
		echo "Aa	 50%"
		echo "aa	 50%"
		echo "Out of all four offspring, two of them will have the alleles Aa, and the other two will have aa."
		;;
	22)
		echo "Breakdown:"
		echo "AA	 25%"
		echo "Aa	 50%"
		echo "aa	 25%"
		echo "Out of all four offspring, two of them will have the alleles Aa, another having AA, and the last having aa."
		;;
	33)
			echo "Breakdown:"
		echo "AA	  0%"
		echo "Aa	  0%"
		echo "aa	100%"
		echo ""
		echo "Out of all four offspring, all of them will have the alleles aa."
		;;
esac





