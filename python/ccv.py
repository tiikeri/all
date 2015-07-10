import sys
print "enter CC number"
cc=raw_input() 
checkNumber=str(cc[-1:])
rest=cc[:-1]
print "Validating..."
numbers=list(rest)
toDouble=[0, 2, 4, 6, 8, 10, 12, 14]
for x in toDouble:
    n=int(numbers[x])
    n=int(n) * 2
    numbers[x]=n
i=0
while i <= 14:
    if numbers[i] >= 10:
        sum(map(int, str(numbers[i])))
        (numbers[i])=int(numbers[i])
        numbers[i]=sum(map(int, str(numbers[i])))
    i+=1
sumOf=(sum(numbers))
sumOf=int(sumOf) * 9
checkDigit=str(sumOf)[-1:]
if checkNumber == checkDigit:
    print "It's valid!"
else:
    print "It's not valid."
    print numbers
