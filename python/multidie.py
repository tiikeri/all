import sys 
import random
print 'how many dies?'
a=raw_input()
i=int(0)
random.seed()
dice=[]
while i <= int(a):
    pips=random.randint(1, 6)
    dice.append(pips)
    i += 1
print dice
    
