import sys
print "enter string"
astring=raw_input()
firstletter=astring[:1]
restof=astring[1:]
if firstletter in ["a", "e", "i", "o", "u"]:
    print "%syay" % astring
else:
    print "%s%say" % (restof, firstletter)
    


