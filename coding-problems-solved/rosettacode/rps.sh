#!/bin/bash
echo "What will you choose? [rock/paper/scissors]"
read response
aiThought=$(echo $[ 1 + $[ RANDOM % 3  ]])
case $aiThought in
	1) 	 aiResponse="rock"   ;;
	2) 	 aiResponse="paper" ;;
	3)  	 aiResponse="scissors"  ;;
esac
echo "AI - $aiResponse"
responses="$response$aiResponse"
case $responses in
	rockrock)  isTie=1  ;;
	rockpaper)  playerWon=0  ;;
	rockscissors)  playerWon=1  ;;
	paperrock)  playerWon=1  ;;
	paperpaper)  isTie=1  ;;
	paperscissors)  playerWon=0  ;;
	scissorsrock)  playerWon=0  ;;
	scissorspaper)  playerWon=1  ;;
	scissorsscissors)  isTie=1  ;;
esac
if [[ $isTie == 1 ]] ; then echo "It's a tie!" && exit 1 ; fi
if [[ $playerWon == 0 ]] ; then echo "Sorry, $aiResponse beats $response , try again.." && exit 1 ; fi
if [[ $playerWon == 1 ]] ; then echo "Good job, $response beats $aiResponse!" && exit 1 ; fi

