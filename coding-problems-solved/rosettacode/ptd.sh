#!/bin/bash
rollDie(){
  die=$(echo $[ 1 + $[ RANDOM % 6  ]])
}
rolls_1=()
rolls_2=()
echo "The game begins..."
whoseTurn=1
while [[ $whoseTurn == 1 ]] ; do {
  echo -n "Player one, roll or hold. [roll/hold] "
  read action
  if [[ $action == "roll" ]] ; then
    rollDie
    case $die in
      1)
        printf "\e[1;31mOh no, you rolled a 1! Your total has been reset.\e[0m\n"
        rolls_1=()
        whoseTurn=2
      ;;
      2|3|4|5|6)
        printf "You rolled a\e[1;31m $die\e[0m.\n"
        rolls_1+=("$die")
        tot1=0
         for i in ${rolls_1[@]}; do
          let tot1+=$i
        done
        printf "Total: \e[1;31m$tot1\e[0m\n"
    esac
  else
    echo "Holding."
    whoseTurn=2
  fi
  while [[ $whoseTurn == 2 ]] ; do {
      echo -n "Player two, roll or hold. [roll/hold] "
  read action
  if [[ $action == "roll" ]] ; then
    rollDie
    case $die in
      1)
        printf "\e[1;31mOh no, you rolled a 1! Your total has been reset.\e[0m\n"
        rolls_2=()
        whoseTurn=1
      ;;
      2|3|4|5|6)
        printf "You rolled a\e[1;31m $die\e[0m\n"
        rolls_2+=("$die")
        tot2=0
         for i in ${rolls_2[@]}; do
          let tot2+=$i
        done
        printf "Total: \e[1;31m$tot2\e[0m\n"
    esac
  else
    echo "Holding."
    whoseTurn=1
  fi
  if [[ $tot2 -ge 100 ]] ; then echo "Player 2 wins!" ; fi
} done
  if [[ $tot1 -ge 100 ]] ; then echo "Player 1 wins!" ; fi
} done

  
