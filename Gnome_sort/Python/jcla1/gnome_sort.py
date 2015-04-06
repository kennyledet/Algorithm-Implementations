# Gnome sort runs in O(n^2), but if the array
# is nearly sorted already it runs in about O(n)
# http://en.wikipedia.org/wiki/Gnome_sort
def gnome_sort(arr):
    pos = 1
    while pos < len(arr):
        if arr[pos] >= arr[pos-1]:
            pos += 1
        else:
            arr[pos], arr[pos-1] = arr[pos-1], arr[pos]
            if pos > 1:
                pos -= 1
    return arr