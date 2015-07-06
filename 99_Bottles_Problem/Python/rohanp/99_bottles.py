#!/usr/bin/env python3

""" 99 Bottles Problem """

__author__ = "Rohan Pandit"

for i in range(99, 0, -1):
<<<<<<< HEAD
    print("{0} {1} of beer on the wall, {0} {1} of beer.".format(i if i != 0 else "no more", "bottles" if i != 1 else "bottle"))
    print("Take one down and pass it around, {0} {1} of beer on the wall.".format("no more" if i == 1 else i - 1, "bottle" if i == 2 else "bottles"))
=======
    print("{0} {1} of beer on the wall, {0} {1} of beer.".format(i, "bottles" if i > 1 else "bottle"  ))
    print("Take one down and pass it around, {0} {1} of beer on the wall".format(i - 1 if i > 1 else "no more", "bottles" if i - 1 != 1 else "bottle" ))
>>>>>>> 35da61a86a8c7008a0b4c332e3277759856b3bf4

print("No more bottles of beer on the wall, no more bottles of beer.")
print("Go to the store and buy some more, 99 bottles of beer on the wall.")
