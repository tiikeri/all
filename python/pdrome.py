import sys
print "enter string"
astring=raw_input()
reverse=astring[::-1]
print "string: %s" % astring
print "reverse: %s" % reverse
if astring==reverse:
    print "It's a palindrome!"
else:
    print "It's not a palindrome."
