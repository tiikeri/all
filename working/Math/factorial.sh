#!/bin/bash
#simple one liner for factorials without the conditions
if [[ $1 == 0 ]] ; then echo "1" ; exit 1 ; fi
if [[ ${#1} > 5 ]] ; then exit 1 ; fi
echo $1 | dc -e '?[q]sQ[d1=Qd1-lFx*]dsFxp'