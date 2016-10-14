#!/usr/bin/env python3

""" 99 Bottles Problem """

__author__ = "Rohan Pandit"

for i in range(99, 0, -1):
    print("{0} {1} of beer on the wall, {0} {1} of beer.".format(i if i != 0 else "no more", "bottles" if i != 1 else "bottle"))
    print("Take one down and pass it around, {0} {1} of beer on the wall.".format("no more" if i == 1 else i - 1, "bottle" if i == 2 else "bottles"))

print("No more bottles of beer on the wall, no more bottles of beer.")
print("Go to the store and buy some more, 99 bottles of beer on the wall.")
