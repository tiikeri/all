#!/bin/bash
word=$1
drow=$(echo $1 | rev)
echo "Given word          $word"
echo "Flipped word        $drow"
echo ""
if [ "$word" = "$drow" ] ; then echo "This word is a palindrome!" ; else echo "This word is not a palindrome." ; fi