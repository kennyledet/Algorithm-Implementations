#!/usr/bin/env python

def bottles():
  bottles = 99
  while bottles > 0:
    print("{0} {1} of beer on the wall, {0} {1} of beer.".format(bottles if bottles != 0 else "no more", "bottles" if bottles != 1 else "bottle"))
    print("Take one down and pass it around, {0} {1} of beer on the wall.".format("no more" if bottles == 1 else bottles - 1, "bottle" if bottles == 2 else "bottles"))
    bottles -= 1
  print("No more bottles of beer on the wall, no more bottles of beer.")
  print("Go to the store and buy some more, 99 bottles of beer on the wall.")

if __name__ == '__main__':
  bottles()
