from gnome_sort import gnome_sort

def test_gnome_sort():
    arr = [5,4,3,2,1]
    assert gnome_sort(arr) == sorted(arr)

    arr = [1]
    assert gnome_sort(arr) == sorted(arr)

    arr = [1,2,3,4,5,6]
    assert gnome_sort(arr) == sorted(arr)

    arr = []
    assert gnome_sort(arr) == sorted(arr)

    print "All test passed!"

if __name__ == '__main__':
    test_gnome_sort()