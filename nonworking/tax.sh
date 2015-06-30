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
echo "Enter your 2 letter state code or a custom sales tax percent."
read tax
if [[ $tax =~ ^-?[0-9]+$ ]] ; then echo "OK." ; fi
states=(NULL AL AK AZ AR CA CO CT DE DC FL GA HI ID IL IN IA KS KY LA ME MD MA MI MN MS MO MT NE NV NH NJ NM NY NC ND OH OK OR PA RI SC SD TN TX UT VT VA WA WV WI WY)
taxes=(NULL 4 0 5.6 7.5 2.9 6.35 0 5.75 6 4 4 6 6.25 7 6 6.5 6 4 5.5 6 6.25 6 6.875 7 4.225 0 5.5 6.85 0 7 5.125 4 4.75 5 5.75 4.5 0 6 7 6 4 7 6.25 4.7 6 4.3 6.5 6 5 4)
for ((i=1; i<=51; i++)) ; do
if [[ tax == ${states[${i}]} ]] ; then
tax=${taxes[$i]}
fi
done
echo $tax
}
get_tax
