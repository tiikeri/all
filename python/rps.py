import sys
import random
print "rock, paper, scissors... [r/p/s]"
p=raw_input()
so="foo"
q=random.randint(1,3)
st="%s" % q
if q==1: q="r" ; st="rock"
if q==2: q="p" ; st="paper"
if q==3: q="s" ; st="scissors"
if p=="r": so="rock"
if p=="p": so="paper"
if p=="s": so="scissors"
vs=[]
vs.append(p)
vs.append(q)
vs=' '.join(vs)
def pWin():
 if vs in ["r s", "p r", "s p"]: print "You win!"
def pLoss():
 if vs in ["s r", "r p", "p s"]: print "Sorry, you lose."
def tie():
 if vs in ["r r", "p p", "s s"]: print "It's a tie!"
 
print "YOU: %s" % so
print "COM: %s" % st
pWin()
pLoss()
tie()

