from random import shuffle

def bogosort(arr):
    while not sorted(arr) == arr:
        shuffle(arr)
    return arr