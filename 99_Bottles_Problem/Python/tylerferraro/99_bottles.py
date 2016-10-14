#!/usr/bin/python

# Generate numbers 99 down to 1
for bottles in (x for x in reversed(range(1, 100))):
  print("{0} {1} of beer on the wall, {0} {1} of beer.".format(bottles if bottles != 0 else "no more", "bottles" if bottles != 1 else "bottle"))
  print("Take one down and pass it around, {0} {1} of beer on the wall.".format("no more" if bottles == 1 else bottles - 1, "bottle" if bottles == 2 else "bottles"))

print "No more bottles of beer on the wall, no more bottles of beer."
print "Go to the store and buy some more, 99 bottles of beer on the wall."
