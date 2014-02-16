from random import randint

# Works by, if not sorted yet, picking 2 random indicies
# and swapping the 2 elements
def bozosort(arr):
    while not sorted(arr) == arr:
        a, b = randint(0, len(arr)-1), randint(0, len(arr)-1)
        arr[a], arr[b] = arr[b], arr[a]
    return arr