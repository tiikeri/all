import sys
print 'enter value'
value=float(raw_input())
qtr=0
dim=0
nik=0
pny=0
while (float(value) - 0.25) >= 0:
    value-=0.25
    qtr+=1
while (float(value) - 0.10) >= 0: 
    value-=0.1
    dim+=1
while (float(value) - 0.05) >= 0:
    value-=0.05
    nik+=1
while (float(value) - 0.01) >= 0:
    value-=0.01
    pny+=1

print 'QUARTERS  ', qtr
print 'DIMES     ', dim
print 'NICKELS   ', nik
print 'PENNIES   ', pny