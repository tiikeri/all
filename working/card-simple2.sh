#!/bin/bash
cat /dev/null > out.txt
count=$1
((count>52)) && exit 1 # Not enough cards.

cards=() # Create an array.
for suit in $'\e[0;31;47m ♦ ' $'\e[0;31;47m ♥' $'\e[0;30;47m ♠' $'\e[0;30;47m ♣' ; do
    for rank in {2..10} J Q K A ; do
        cards+=("$suit $rank"$' \e[0m') # All possible combinations.
    done
done

hand=($(
        for ((i=0; i<${#cards[@]}; i++)) ; do
            echo $i
        done | gshuf -n "$count" # Pick random cards.
        ))


# Associative arrays to count occurrences.
for ((f=0; f<=5; f++)) ; do
	echo -n "."
	sleep 0.1
done
echo  " "
sleep 0.25
echo  " "
sleep 0.05
echo  " "

declare -a suits
declare -a ranks
for card_i in "${hand[@]}" ; do
    card="${cards[card_i]}"
    echo -n "$card "
        var=$card
	var2=${var##?????????}
	var3=${var2#0;30;47m}
	var4=${var3%[0m}
	echo "$var4" >> out.txt
    sleep 0.06
done 
for s in "${!suits[@]}" ; do
    echo "$s ${suits[$s]}"
done 

echo

for r in "${!ranks[@]}" ; do
    echo "$r ${ranks[$r]}"
done

