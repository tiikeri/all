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
vs=[] ; vs.append(p) ; vs.append(q) ; vs=''.join(vs)
def pWin():
    if vs in ["rs", "pr", "sp"]: print "You win!"
def pLoss():
    if vs in ["sr", "rp", "ps"]: print "Sorry, you lose."
def tie():
    if vs in ["rr", "pp", "ss"]: print "It's a tie!"
print "YOU: %s" % so ; print "COM: %s" % st
pWin()
pLoss()
tie()

