#!/usr/bin/env python3
""" 99 Bottles Problem """
__author__ = "Rohan Pandit"

for i in range(99, 0, -1):
    print("{0} {1} of beer on the wall, {0} {1} of beer.".format(i, "bottles" if i > 1 else "bottle"  ))
    print("Take one down and pass it around, {0} {1} of beer on the wall".format(i - 1 if i > 1 else "no more", "bottles" if i - 1 > 1 else "bottle" ))

print("No more bottles of beer on the wall, no more bottles of beer.")
print("Go to the store and buy some more, 99 bottles of beer on the wall.")
