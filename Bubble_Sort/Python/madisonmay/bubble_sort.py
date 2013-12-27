def bubble_sort(l):
    """
    Bubble Sort
    -----------
    Advantages:
        - stable
        - in-place
    Disadvantages:
        - slow for large data sets
    Time Complexity:
        - worst:   O(n^2)
        - average: O(n^2)
        - best:    O(n)
    Space Complexity:
        - O(1)
    """
    temp = l[:]
    size = len(temp)
    sorted_list = False;
    while not sorted_list:
        modified = False;
        for i in range(1, size):
            if temp[i-1] > temp[i]:
                modified = True;
                temp[i], temp[i-1] = temp[i-1], temp[i]
        if not modified:
            sorted_list = True
    return temp

if __name__ == '__main__':
    # test cases
    help(bubble_sort)
    l = list(range(10, 0, -1))
    print('Unsorted list: ' + str(l));
    l = bubble_sort(l)
    print('Sorted list: ' + str(l))
