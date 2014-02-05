# this is a python example of a mergesort generator
# (list.sort() is much faster)
#
# Edited by: Jonathan Lebron 2013


def merge_sort(foo):
    if len(foo) < 2:
        return foo

    mid = len(foo) // 2
    return merge(merge_sort(foo[:mid]), merge_sort(foo[mid:]))


def merge(left, right):
    output = []
    i = j = 0

    while i < len(left) or j < len(right):
        if i >= len(left):
            output.append(right[j])
            j += 1
        elif j >= len(right):
            output.append(left[i])
            i += 1
        elif right[j] < left[i]:
            output.append(right[j])
            j += 1
        else:
            output.append(left[i])
            i += 1

    return output
