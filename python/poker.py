#!/usr/bin/env python 
# -*- coding: utf-8 -*-
import sys ; import random
values = range(1, 11) + "J Q K".split() ; suits = "♦ ♣ ♥ ♠".split() 
deck_of_cards = ["%s%s" % (v, s) for v in values for s in suits] 
while s<=3: random.seed() ; random.shuffle(deck_of_cards) ; s+=1
c=1 ; hand=[] ; while c<=5: 
    pick=random.randint(0, int(len(deck_of_cards))-1) ; card=deck_of_cards[pick]
    hand.append(card) ; deck_of_cards.remove(card) ; c+=1
str=' '.join(hand) ; acount=str.count('A') ; twocount=str.count('2') ; threecount=str.count('3') ; fourcount=str.count('4') ; fivecount=str.count('5') ; sixcount=str.count('6'); sevencount=str.count('7'); eightcount=str.count('8'); ninecount=str.count('9'); tencount=str.count('10'); jcount=str.count('J'); qcount=str.count('Q') ; kcount=str.count('K')
dmd=str.count('♦') ; clb=str.count('♣') ; hrt=str.count('♥') ; spd=str.count('♠')
def is_straight_flush():
    if any(x == 5 for x in (dmd, clb, hrt, spd)):
        vals=[int(n) for n in str.split() if s.isdigit()] ; vals.sort()
        if len(vals) == 5: if (vals[0] + 1 == vals[1] and vals[1] + 1 == vals[2] and vals[2] + 1 == vals[3] and vals[3] + 1 == vals[4]): print "STRAIGHT FLUSH"
        elif vals == ["[7, 8, 9, 10]", "[8, 9, 10]", "[9, 10]", "[2, 3, 4, 5]"]: print "STRAIGHT FLUSH"
            
def is_four_of_a_kind():
    if any(x == 4 for x in (acount, twocount, threecount, fourcount, fivecount, sixcount, sevencount, eightcount, ninecount, tencount, jcount, qcount)): print "4 OF A KIND"
        
def is_full_house():
    if any(x == 3 for x in (acount, twocount, threecount, fourcount, fivecount, sixcount, sevencount, eightcount, ninecount, tencount, jcount, qcount)) and any(x == 2 for x in (acount, twocount, threecount, fourcount, fivecount, sixcount, sevencount, eightcount, ninecount, tencount, jcount, qcount)): print "FULL HOUSE"
        
def is_flush():
     if any(x == 5 for x in (dmd, clb, hrt, spd)):
        print "FLUSH"    
def is_straight():
    vals=[int(n) for n in str.split() if s.isdigit()] ; vals.sort()
    if len(vals) == 5: if (vals[0] + 1 == vals[1] and vals[1] + 1 == vals[2] and vals[2] + 1 == vals[3] and vals[3] + 1 == vals[4]): print "STRAIGHT"
    elif vals == ["[7, 8, 9, 10]", "[8, 9, 10]", "[9, 10]", "[2, 3, 4, 5]"]: print "STRAIGHT"  
def is_three_of_a_kind():
    if any(x == 3 for x in (acount, twocount, threecount, fourcount, fivecount, sixcount, sevencount, eightcount, ninecount, tencount, jcount, qcount)): print "THREE OF A KIND" 
def is_pair():
    if any(x == 2 for x in (acount, twocount, threecount, fourcount, fivecount, sixcount, sevencount, eightcount, ninecount, tencount, jcount, qcount)): print "PAIR"
    else:
        handv=' '.join(hand)
        if   "K" in handv: print "KING HIGH" ; elif "Q" in handv: print "QUEEN HIGH" ; elif "J" in handv: print "JACK HIGH" ; elif "10" in handv: print "TEN HIGH" ; elif "9" in handv: print "NINE HIGH" ; elif "8" in handv: print "EIGHT HIGH" ; elif "7" in handv: print "SEVEN HIGH" ; elif "6" in handv: print "SIX HIGH"
print ""
is_straight_flush() ; is_four_of_a_kind() ; is_full_house() ; is_flush() ; is_straight() ; is_three_of_a_kind() ; is_pair()
print ' '.join(hand) #print out the hand
