#!/usr/bin/python
# -*- coding: utf-8 -*-

import sys
import random
values = range(2, 11) + 'J Q K A'.split()  # assign values
suits = '♦  ♣  ♥  ♠ '.split()  # assign suits
random.seed()
deck_of_cards = ['%s%s' % (v, s) for v in values for s in suits]  # make the list
while s <= 3:  # shuffle the deck three times for ensured randomness
    random.seed()
    random.shuffle(deck_of_cards)
    s += 1
c = 1
tok=0
hand = []  # make a list for the hand
while c <= 5:
    pick = random.randint(0, int(len(deck_of_cards)) - 1)  # choose a number from 1 to how many cards are left
    card = deck_of_cards[pick]  # match the number picked to the card in the deck
    hand.append(card)  # add the card to the list
    deck_of_cards.remove(card)  # remove the card from the deck so it is not picked again
    c += 1
str = ' '.join(hand)
acount = str.count('A')
twocount = str.count('2')
threecount = str.count('3')
fourcount = str.count('4')
fivecount = str.count('5')
sixcount = str.count('6')
sevencount = str.count('7')
eightcount = str.count('8')
ninecount = str.count('9')
tencount = str.count('10')
jcount = str.count('J')
qcount = str.count('Q')
kcount = str.count('K')
dmd = str.count('♦')
clb = str.count('♣')
hrt = str.count('♥ ')
spd = str.count('♠')


def is_straight_flush():
    if any(x == 5 for x in (dmd, clb, hrt, spd)):
        vals = [int(n) for n in str.split() if s.isdigit()]
        vals.sort()
        if len(vals) == 5:
            if vals[0] + 1 == vals[1] and vals[1] + 1 == vals[2] \
                and vals[2] + 1 == vals[3] and vals[3] + 1 == vals[4]:
                print 'STRAIGHT FLUSH'
        elif vals == ['[7, 8, 9, 10]', '[8, 9, 10]', '[9, 10]',
                      '[2, 3, 4, 5]']:

            print 'STRAIGHT FLUSH'
            print ' '.join(hand)
            exit()


def is_four_of_a_kind():
    if any(x == 4 for x in (
        acount,
        twocount,
        threecount,
        fourcount,
        fivecount,
        sixcount,
        sevencount,
        eightcount,
        ninecount,
        tencount,
        jcount,
        qcount,
        kcount,
        )):
        print '4 OF A KIND'
        print ' '.join(hand)
        exit()

def is_full_house():
    if any(x == 3 for x in (
        acount,
        twocount,
        threecount,
        fourcount,
        fivecount,
        sixcount,
        sevencount,
        eightcount,
        ninecount,
        tencount,
        jcount,
        qcount,
        kcount,
        )) and any(x == 2 for x in (
        acount,
        twocount,
        threecount,
        fourcount,
        fivecount,
        sixcount,
        sevencount,
        eightcount,
        ninecount,
        tencount,
        jcount,
        qcount,
        kcount,
        )):
        print 'FULL HOUSE'
        print ' '.join(hand)
        exit()


def is_flush():
    if any(x == 5 for x in (dmd, clb, hrt, spd)):
        print 'FLUSH'
        print ' '.join(hand)
        exit()

def is_straight():
    vals = [int(n) for n in str.split() if s.isdigit()]
    vals.sort()
    if len(vals) == 5:
        if vals[0] + 1 == vals[1] and vals[1] + 1 == vals[2] \
            and vals[2] + 1 == vals[3] and vals[3] + 1 == vals[4]:
            print 'STRAIGHT'
    elif vals == ['[7, 8, 9, 10]', '[8, 9, 10]', '[9, 10]',
                  '[2, 3, 4, 5]']:
        print 'STRAIGHT'
        print ' '.join(hand)
        exit()

def is_three_of_a_kind():
    if any(x == 3 for x in (
        acount,
        twocount,
        threecount,
        fourcount,
        fivecount,
        sixcount,
        sevencount,
        eightcount,
        ninecount,
        tencount,
        jcount,
        qcount,
        kcount,
        )):
        print 'THREE OF A KIND'
        print ' '.join(hand)
        exit()

def is_pair():
    if any(x == 2 for x in (
        acount,
        twocount,
        threecount,
        fourcount,
        fivecount,
        sixcount,
        sevencount,
        eightcount,
        ninecount,
        tencount,
        jcount,
        qcount,
        kcount,
        )):
        print 'PAIR'
        print ' '.join(hand)
    else:
        else:
            handv = ' '.join(hand)
            if 'K' in handv:
                print 'KING HIGH'
            elif 'Q' in handv:
                print 'QUEEN HIGH'
            elif 'J' in handv:
                print 'JACK HIGH'
            elif '10' in handv:
                print 'TEN HIGH'
            elif '9' in handv:
                print 'NINE HIGH'
            elif '8' in handv:
                print 'EIGHT HIGH'
            elif '7' in handv:
                print 'SEVEN HIGH'
            elif '6' in handv:
                print 'SIX HIGH'
            print ' '.join(hand)

print ''
is_straight_flush()
is_four_of_a_kind()
is_full_house()
is_flush()
is_straight()
is_three_of_a_kind()

# is_two_pairs,

is_pair()
