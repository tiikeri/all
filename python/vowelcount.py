import sys
print "enter string"
sys.stdout.flush()
astring=raw_input()
a=astring.count("a")
e=astring.count("e")
i=astring.count("i")
o=astring.count("o")
u=astring.count("u")
total=a+e+i+o+u
print "Total: %d" % total
print "A: %d" % a
print "E: %d" % e
print "I: %d" % i
print "O: %d" % o
print "U: %d" % u
