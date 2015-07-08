#!/bin/bash
echo "Enter floor's width"
read fw
echo "Enter floor's height"
read fh
echo "Assuming the tile is a square, enter its side length (1 in ~ 0.083ft)"
read ts
echo "Enter cost per tile"
read c
floorarea=$(echo "scale=2; $fw * $fh" | bc)
tilearea=$(echo "scale=2; $ts^2" | bc)
tileToFloor=$(echo "scale=1; $floorarea / $tilearea" | bc)
costofTiling=$(echo "scale=2; $c * $tileToFloor" | bc)
echo "Floor's WxH         $fw units x $fh units"
echo "Tile's Sidelength   $ts units"
echo "Cost/Tile           $ $c"
echo "Floor's Area        $floorarea units^2"
echo "Tile's Area         $tilearea units^2"
echo "# of Tiles          $tileToFloor tiles"
echo ""
echo "The cost of tiling the floor is roughly $ $costofTiling"