#!/bin/bash -
#title          :tax.sh
#description    :a tax calculator
#author         :Viktor Ahlström
#date           :20150627
#version        :1.9
#usage          :./tax.sh
#notes          :
#bash_version   :3.2.48(1)-release
#============================================================================
get_tax() {
    tax=$1
    if [[ $tax =~ ^-?[0-9]+$ ]] ; then echo "OK." ; fi
    states=(
    AL AK AZ AR 
    CA CO CT
    DE DC
    FL
    GA
    HI
    ID IL IN IA
    KS KY
    LA
    ME MD MA MI MN MS MO MT
    NE NV NH NJ NM NY NC ND
    OH OK OR
    PA
    RI
    SC SD
    TN TX
    UT
    VT VA
    WA WV WI WY
    )
    taxes=(
    4 0 5.6 6.5
    7.5 2.9 6.35
    0 5.75
    6
    4
    4
    6 6.25 7 6
    6.15 6
    4
    5.5 6 6.25 6 6.875 7 4.225 0
    5.5 6.85 0 7 5.125 4 4.75 5
    5.75 4.5 0
    6
    7
    6 4
    7 6.25
    4.7
    6 4.3
    6.5 6 5 4
    )
    for ((i=0; i<=50; i++)) ; do # cycle through all 51 2 letter codes
    check=$(echo ${states[$i]}) # set the current check code
    if [[ $tax == $check ]] # see if the entered code matches the current check code
        then
    taxpercent=$(echo ${taxes[$i]}) #set the sales tax percentage
    break #break away from the loop to avoid excess checking
    fi
    done
}
if [[ $# == 2 ]] ; then #see if arguments are present
	get_tax $1 $2 #run the function shown above with the args that were present when command was run
	subtotal=$2 #set the subtotal to the second command
	percent=$(echo "scale=5;$taxpercent * 0.01" | bc) #format the tax percentage to proper value
	stax=$(echo "scale=2;$subtotal * $percent" | bc) #multiply the subtotal by the percent and store in a variable for later
    	grandtotal=$(echo "$stax + $subtotal" | bc) #add the tax figured out in the line before to the subtotal
#number formatting=====================================================================###
											#
		staxdec=$(echo $stax | sed 's/:*.//')					#
		if [[ ${#staxdec} == 4 ]] ; then grandtotal=${grandtotal%?} ; fi	#
		if [[ ${#staxdec} == 5 ]] ; then grandtotal=${grandtotal%??} ; fi	#
		if [[ ${#staxdec} == 4 ]] ; then stax=${stax%?} ; fi			#
		if [[ ${#staxdec} == 5 ]] ; then stax=${stax%??} ; fi			#
		if [[ ${#stax} == 4 ]] ; then grandtotal=${grandtotal%?} ; fi		#
		if [[ ${#stax} == 5 ]] ; then grandtotal=${grandtotal%??} ; fi		#
		if [[ ${#stax} == 4 ]] ; then stax=${stax%?} ; fi			#
		if [[ ${#stax} == 5 ]] ; then stax=${stax%??} ; fi			#
		if [[ $stax < 1 ]] ; then						#
		stax=$(echo -ne "0" ; echo -ne $stax)					#
	else										#
    		stax=$stax								#
	fi										#
											#
#======================================================================================###
	echo -e "###########################"
	echo -e "SUBTOTAL      \$$subtotal  "
	echo -e "SALES TAX %   $taxpercent% "
	echo -e "SALES TAX     \$$stax      "
	echo    "###########################"
	echo -e "GRAND TOTAL   \$$grandtotal"
else #run on an invalid input
    	echo "Usage: tax.sh <[state] [tax percent]> <subtotal>"
fi
