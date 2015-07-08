# all
*a repo for all of my scripts.*
    
     __                        __                   __              ___    ___      
    /\ \                      /\ \                 /\ \            /\_ \  /\_ \     
    \ \ \____     __      ____\ \ \___         ____\ \ \___      __\//\ \ \//\ \    
     \ \ '__`\  /'__`\   /',__\\ \  _ `\      /',__\\ \  _ `\  /'__`\\ \ \  \ \ \   
      \ \ \L\ \/\ \L\.\_/\__, `\\ \ \ \ \    /\__, `\\ \ \ \ \/\  __/ \_\ \_ \_\ \_ 
       \ \_,__/\ \__/.\_\/\____/ \ \_\ \_\   \/\____/ \ \_\ \_\ \____\/\____\/\____\
        \/___/  \/__/\/_/\/___/   \/_/\/_/    \/___/   \/_/\/_/\/____/\/____/\/____/
                                                                                
                                                                                
##Scripts 
***
 `change-return.sh` returns change amount for a value of money.  
 Syntax: `change-return <dollars> [cents]`
 ***
 `coinflip.sh` (digitally) flips coins for you. It will count the number of coins and, on demand, display experimental probabilities of getting heads or tails.  
 Syntax: `coinflip <number of coins> [e]` *e displays experimental probability*
 ***
 `dna.sh` generates a DNA sequence that is colored according to the components of a DNA sequence (AGCT).  
 Syntax: `dna <sequence length>`
 ***
 `pi-to-nth.sh` returns, respectively, pi to the *n*th digit.  
 Syntax: `pi-to-nth <n>`
 ***
 `poker` returns a randomly generated poker hand suited for Texas Hold'em (5 cards)  
 *No arguments*
 ***
 `random` returns a randomly generated string based on arguments given. Substitute n with a number to batch generate.   
 Syntax: `random <[A-Z][a-z][0-9][custom characters]> <length> [n]`
 ***
 `ccv.sh` validates a credit card number using *Luhn's Algorithm*.  
 Syntax: `ccv <cc number>`
 ***
 `tax.sh` adds the sales tax for a price entered by a user.
 Syntax: `tax <two digit state code or own sales tax percent> <subtotal>`
 ***
 `horoscope.sh` displays the horoscope from the huffington post.
 Syntax: `horoscope <zodiac>`
 ***
 `bank_manager.sh` is a virtual ATM! Enter your transactions manually and track your account balances.  
 Syntax: `bank_manager [view-balances] [view-statement]` (The script is interactive)
 ***
 `99bottles` ♪ Ninety-nine bottles of beer on the wall, take one down and pass it around… ♪
 ***
 `stocks.sh` gets the current price for a certain stock from *[Google Finance](https://www.google.com/finance)*.  **requires jq. `sudo apt-get jq` or `brew install jq`**  
 Syntax: `stocks <stock symbol>`
 ***
 `crchecker.sh` gets the current exchange rate for a certain exchange (like USDGBP).  
 Syntax: `crchecker <exchange>`
 ***
 `cconvert.sh` converts currencies.  
 Syntax: `cconvert <amount> <source currency> <result currency>`
 ***
 `fibonacci-sequcence.sh` finds the fibonacci sequence of *n*.
 Syntax: `fibonacci-sequence <num>`
 ***
 `mortgage.sh` calculates monthly payment for date (interactive, no syntax)
 ***
 `pf.sh` finds the prime factorization of a number.
 Syntax: `pf <num>`
 ***
 `wxhfloor.sh` finds the price of tile for covering wxh floor (interactive, no syntax)
 ***
 `e_to_nth.sh` displays eulers number to nth digit.
 Syntax: `e_to_nth <num>`
 ***
 `factorial.sh` respectively, displays the factorial of a number.
 Syntax: `factorial <num>`
 ***
 `atinlay.sh` displays the given string in pig latin.
 Syntax: `atinlay <string>`
 ***
 `pdrome.sh` checks if the given string is a [palindrome](https://en.wikipedia.org/wiki/Palindrome).
 Syntax: `pdrome <string>`
 ***
 `vowelcount.sh` counts the vowels in a string, displays the total and breaks the totals down.
 Syntax: `vowelcount "<string>"` *note the quotations.*
 ***