import sys
import random
print "number of coins to flip:"
a = raw_input()
random.seed()
z=int(0)
h=0
t=0
while z < int(a):
    aCoin=random.randint(1,2)
    if aCoin==1:
        sys.stdout.write('H')
        h+=1
    elif aCoin==2:
        sys.stdout.write('T')
        t+=1
    z+=1
print ""
print "Heads:    %d" % h
print "Tails:    %d" % t
