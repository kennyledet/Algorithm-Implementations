#!/usr/bin/python

# Generate numbers 99 down to 1
for bottles in (x for x in reversed(range(1, 100))):
  print "%s bottles of beer on the wall, %s bottles of beer." % (bottles, bottles)
  print "Take one down and pass it around, %s bottles of beer on the wall." % (bottles - 1 if bottles > 1 else "no more")

print "No more bottles of beer on the wall, no more bottles of beer."
print "Go to the store and buy some more, 99 bottles of beer on the wall."