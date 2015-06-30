#!/bin/bash
varget() {
echo "Hello."
sleep 0.5
echo "Please enter the width of the tile."
    read tileWidth
echo "OK."
echo "Please enter the height of the tile."
    read tileHeight
echo "OK."
echo "Please enter the width of the floor to cover."
    read floorWidth
echo "OK."
echo "Please enter the height of the floor to cover."
    read floorHeight
echo "OK."
echo "Please enter the cost per tile."
    read tileCost
echo "OK."
echo "Calculating"
for ((i=3; i<=3; i++))
do
echo -n "."
sleep 0.1
done
}
calc() {
tileArea=$(echo "$tileWidth * $tileHeight" | bc)
floorArea=$(echo "$floorWidth * floorHeight" | bc)
qtyTiles=$(echo "scale=2;$floorArea / $tileArea" | bc)
totalCost=$(echo "scale=2;$qtyTiles * $tileCost" | bc)

}
display() {
echo 'It would cost $'
echo -n "$totalCost"
echo -n " to tile the floor's area."
}
varget
calc
display