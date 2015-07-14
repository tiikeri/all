# all
*this repo is all of my other repos for scripts conjoined.*  
**some scripts may require the following:**
  
- `jq` 
- `openssl`

*both of these can be found and installed by `apt-get` and `brew`.*

***
    
     __                        __                   __              ___    ___      
    /\ \                      /\ \                 /\ \            /\_ \  /\_ \     
    \ \ \____     __      ____\ \ \___         ____\ \ \___      __\//\ \ \//\ \    
     \ \ '__`\  /'__`\   /',__\\ \  _ `\      /',__\\ \  _ `\  /'__`\\ \ \  \ \ \   
      \ \ \L\ \/\ \L\.\_/\__, `\\ \ \ \ \    /\__, `\\ \ \ \ \/\  __/ \_\ \_ \_\ \_ 
       \ \_,__/\ \__/.\_\/\____/ \ \_\ \_\   \/\____/ \ \_\ \_\ \____\/\____\/\____\
        \/___/  \/__/\/_/\/___/   \/_/\/_/    \/___/   \/_/\/_/\/____/\/____/\/____/
                                                                                
                                                                                
###Scripts not based on a coding problem -
    cconvert 		converts currencies  
    coinflip  		generates coin flips (*optionally displays experimental probabilities*)  
    crchecker  		checks the trade value of currencies
    dna 			generates a random dna sequence
    poker			generates a random poker hand
    random 			generates a random string
    stocks			checks the stock market
    virc			checks the vircurex exchange for cryptocurrencies
    balance			evaluates and balances two equations
    mendel			generates probability of offspring getting a gene via mendelian genetics
    encryptions		anything in encryption-scripts.
    pwsafe			a password safe that keeps your passwords protected by using aes256 encryption. 
    
    ##############
    #  Syntaxes  #
    ##############
    
    cconvert		<amount> <currency> <currency> - e.g 10.00 USD GBP
    coinflip		<number> [e] (e displays experimental probabilities)
    crchecker		<exchange> - e.g USDGBP or USDSEK
    dna				<length>
    poker			*no syntax*
    random			<[A-Z][a-z][0-9]"*custom str*"> <length> <amount of strings>
    stocks			<ticker> - e.g GOOG or AAPL
    virc			<currency> <currency> - e.g DOGE BTC
    balance			<equation1> <equation2> - e.g (1+1)4 4(4-2)
	encryptions		<string>
	pwsafe			interactive		
    
###Scripts based on coding problems -
######Euler's Project:
    3and5			adds the sum of all the integers from 1-999 that are multiples of 3 and 5
    sumsd			finds the difference of (1+2+3..100)^2 and (1^2+2^2+3^2..100^2)
######[Karan](https://github.com/karan)'s Projects Repo
    bank_manager	a virtual atm
    ccv				validates a credit card number using luhn's algorithm
    change-return	returns change for a given amount of money
    e_to_nth		returns euler's number to the nth digit
    factorial		finds the factorial of a number
    fs				finds the fibonacci sequence up to n
    hn				checks if a number is a happy number
    horoscope		gets today's horoscope for a zodiac sign
    mortgage		finds the monthly payment for a mortgage
    pdrome			see if a string is a palindrome
    pf				gets the prime factorization for a number
    pi-to-nth		returns pi to the nth digit
    tax				calculate the price of something plus sales tax
    vowelcount		counts the vowels in the string given
    wxhfloor		finds cost to tile WxH floor.
    
    ############
    # Syntaxes #
    ############
    
    bank_manager	interactive
    ccv				<cc number>
    change-return	interactive
    e_to_nth		interactive
    factorial		<number>
    fs				interactive
    hn				<number>
    horoscope		<zodiac sign>
    mortgage		interactive
    pdrome			"<string>"
    pf				<number>
    pi-to-nth		interactive
    tax				<state or %> <subtotal> or interactive
    vowelcount		"<string>"
    wxhfloor		interactive
######Rosetta Code
    99bottles		♪ Ninety-nine bottles of beer on the wall, take one down and pass it around… ♪
    floyd			generates n rows of floyd's triangle
    langinascii		displays 'bash shell' in 3D ASCII art
    rot13			prints the string in rot13
    sumdigits		displays the sum of all digits in a number
    ptg				'pig the dice' game
    rps				rock, paper, scissors!
    
    ############
    # Syntaxes #
    ############
    
    99bottles		*no syntax*
    floyd			<rows>
    langinascii		*no syntax*
    rot13			"<strings>"
    sumdigits		<number>
    ptg				interactive
    rps				interactive