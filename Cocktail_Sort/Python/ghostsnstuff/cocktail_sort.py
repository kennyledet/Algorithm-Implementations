# Cocktail Sort (bidirectional bubble sort)
# @author ghostsnstuff
# date: 1399995932446
# O(n^2) worst case
# O(n^2) average case
# O(n) best case
# the first inner loop traverses up the list
# the second inner loop traverses down the list
# for each iteration the current node is compared to the next node
# if the current node is bigger the next node the elements are swapped
# sorting is done when swapped == false

def cocktailSort(a):
  swapped = None
  while True:
    i = 0
    while i < len(a)-2:
      if a[i] > a[i+1]:
        temp = a[i]
        a[i] = a[i+1]
        a[i+1] = temp
        swapped = True
      i+=1
    if swapped != True:
      break
    swapped = False
    k = len(a)-2
    while k > 0:
      if a[k] > a[k+1]:
        temp = a[k]
        a[k] = a[k+1]
        a[k+1] = temp
        swapped = True
      k-=1
    if swapped != True:
      break
  return a
