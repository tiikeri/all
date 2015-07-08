#!/bin/bash
str=$(echo $1 | sed 's/ //g')
a=$(grep -o "[a|A]" <<<"$str" | wc -l)
e=$(grep -o "[e|E]" <<<"$str" | wc -l)
i=$(grep -o "[i|I]" <<<"$str" | wc -l)
o=$(grep -o "[o|O]" <<<"$str" | wc -l)
u=$(grep -o "[u|U]" <<<"$str" | wc -l)
total=$(grep -o "[a|e|i|o|u|A|E|I|O|U]" <<<"$str" | wc -l)
echo "$total vowels."
echo "Breakdown"
if [[ $a < 0 ]] ; then 
	echo "Instances of 'a'           $a"
fi
if [[ $e < 0 ]] ; then 
	echo "Instances of 'e'           $e"
fi
if [[ $i < 0 ]] ; then 
	echo "Instances of 'i'           $i"
fi
if [[ $o < 0 ]] ; then 
	echo "Instances of 'o'           $o"
fi
if [[ $u < 0 ]] ; then 
	echo "Instances of 'u'           $u"
fi
