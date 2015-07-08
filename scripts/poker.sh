echo " "
deck()(HOME=/dev/null ${deck:+"echo"}
        tr=$(gprintf '[%s*19]' 1 2 3 4 5 6 7 8 9 a b c d)
        gtr '\0-\377' "[J*9]$tr"                 |
        gdd cbs=1 obs=2 conv=unblock             |
        gpaste -d'W\nX\nY\nZ' - ~ - ~ - ~ - ~    |
        gsed '   /^J/d;1!G;/^\(.*\)\n.*\1/d
                h;/\(.*\n\)\{51\}/q;d'
)       <"${1:-/dev/urandom}"

draw()  if      [ -n "${1##*[!0-9]*}" ] || return 2
        then    case    $((${#deck}>($1*3)))$deck in
                (?*[!0-9W-Za-d[:space:]]*)
                        return 2;;
                (0*)    deck=$deck$(deck)
                        draw "$1";;
                (1*)    eval "  hand='$(echo "$deck" |
                                sed "$1 N;s/\n/' deck='/")'"
        esac;   fi
show()  case    $1      in
        (*[!0-9W-Za-d[:space:]]*|'')    return 2;;
        (*) (   eval "  $(gprintf "T='\t' E=\033 nl='\n'")"
                str(){  m=$1 l=\$1$2 r=\$i$3 d=......
                        set 9 8 7 6 5 4 3 2 1
                        for i in d c b a "$@"
                        do      [ "$i" = d ] && M=ROYAL || M=STRAIGHT M=${M#"$m"}
                                eval gprintf "\"\ts/.*$l$d$r.*/"'$M${M:+ }$m:/;t$a.1\n"'
                                [ "$1" = 1 ] && unset a r l d i m M && break
                        shift;  done; }
                knd(){  c=$1    m="$1 OF A KIND" IFS=$nl
                        shift;  s="$*"; set -f .'\\1'
                        until   [ "$#" -gt "$((c-1))" ]
                                do set "$@" "$@"
                        done;   shift "$(($#-(c-1)))"
                        printf  %b "\t/\([a-d0-9]\)$@/{\n"
                        for     s in $s; do eval 'printf "\t\t%s\n" "'"$s\""; done
                        printf  "\tt$a.1\n\t}\n"; unset l c a s IFS; }
                br(){   case    $a.$1   in
                        (.*|*[!0-9]*.)  return 2;;
                        (*.-t)  printf  "\n:$a.0\n%s\n" \
                                        "$a!b${n:-$((a+1)).0}";;
                        (*.-b)  printf ":$a.1\n";;esac;shift
                        for s do eval 'printf "\t%s\n" "'"$s\"";done
                        unset n IFS a s; }
                for k in k1.2,1.2 k1.1,1.1 uk1.1,1.1
                do      echo "$1" | sort -"$k"; echo
                done|   sed -ne:n -e'$!N;s/\n\(.\)/\1/;tn
                                x;/./!g;x;$G;s/\n$//p'  |
                sed -ne"$(     a=1 br -t
                                a=1 str FLUSH   '\(.\)' '\\\1'
                                a=1 br -b       '/:/!s/.*\([WXYZ]\).......\\1.*/FLUSH:/' \
                                                '/^[RS]/h' //be /:/h n
                                a=2 br -t
                                a=2 knd 4       s/.\*/\$m:/
                                a=2 knd 3       H s/// 's/.*\([a-d0-9]\).\1.*/FULLHOUSE:/' \
                                                /:/\!g  's/.*\n.*/$m:/' 'x;s/\n.*//;x'
                                a=2 knd 2       s///2 tP 's/.*/$m:/' :P '/:/!s/.*/2 PAIR:/'
                                a=2 br -b       /^\[F4]/h //be x /^FL/h //be x /:/h n
                                n=e a=3 br -t
                                a=3 str STRAIGHT .
				a=3 br -b       /:/h x h; )
                :e" -e'5!n;5!be' -e'y/123456789abcd/234567891JQKA/
                s/\([0-9JQKA]*\)\([WXYZ]\)/ '"$E[0;3\2;47m \1 $E["'m /g
                s/W\([^ ]* \)/1\1♦ /g;s/X\([^ ]* \)/1\1♥ /g
                s/Y\([^ ]* \)/0\1♠ /g;s/Z\([^ ]* \)/0\1♣ /g
                s/ 1/10/g;x;/.\{8\}/!s/$/'"$T"'/;G;s/\n\(.*\)/'"$T\1$E"'[m/
                s/\([^m]*m\)\{26\} /&\'"$nl\\$nl$T$T/g;s/[[:space:]]*$//p"
)       esac
draw 5
show "$hand"

