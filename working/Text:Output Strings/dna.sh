#!/bin/bash
if [ $# == 1 ]
then
    < /dev/urandom LC_CTYPE=C tr -dc AGCT | head -c $1 | while read -n 1 x
    do
        case $x in
            A)
                echo -ne '\033[0;34mA'
            ;;
            G)
                echo -ne '\033[0;32mG'
            ;;
            C)
                echo -ne '\033[0;31mC'
            ;;
            T)
                echo -ne '\033[0;33mT'
            ;;
        esac
	sleep 0.05

    done
    echo -e '\033[0m'
    exit 0
fi
exit 1
