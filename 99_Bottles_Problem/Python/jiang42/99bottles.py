def bottles():
  bottles = 99
  while bottles > 0 :
    print("{0} bottles of beer on the wall, {1} bottles of beer.".format(bottles,bottles))
    bottles -= 1
    print("Take one down and pass it around, {0} bottles of beer on the wall.".format(bottles if bottles > 0 else "no more"))
  print("No more bottles of beer on the wall, no more bottles of beer.")
  print("Go to the store and buy some more, 99 bottles of beer on the wall.")

if __name__ == '__main__':
  bottles()
