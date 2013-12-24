# this is a python example of a mergesort generator
# (list.sort() is much faster)
from heapq import merge


def merge_sort(foo):
    length = len(foo)
    first_half = merge_sort(foo[:length/2]) if length > 1 else foo
    second_half = merge_sort(foo[length/2:]) if length > 1 else []
    return merge(first_half, second_half)
