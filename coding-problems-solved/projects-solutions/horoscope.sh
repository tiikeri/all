#!/bin/bash
##horoscope - get the horoscope from huffington post.
get_horoscope(){
	cat /dev/null >> wget.txt # clear wget.txt
	zodiacSign=$(echo $1 | tr '[:upper:]' '[:lower:]') # since the urls are case-sensitive, change all the letters of argument to lowercase
	url="http://www.huffingtonpost.com/horoscopes/astrology/$zodiacSign/" # set the url to the base url w/ zodiac sign
	horoscope=$(wget $url -q -O -  | sed -e '1,710d;712,9999d') # retrieve the horoscope bit from the entire code
	######text formatting######
	horoscope=${horoscope#?????} # removes tab character and <p>
	horoscope=${horoscope%?????} # removes </p>
}
display_horoscope(){
	displaySign="$(tr '[:lower:]' '[:upper:]' <<< ${zodiacSign:0:1})${zodiacSign:1}"
	theDate=$(date "+%A, %B %d, %Y")
	echo "Here is $displaySign's horoscope for $theDate"
	echo ">>>  $horoscope"
}
get_horoscope $1
display_horoscope
	
