def insertion_sort(l):
    """
    Insertion Sort
    --------------
    Advantages:
        - simple implementation
        - efficient for small data sets
        - efficient at sorting partially sorted datasets
        - can sort list as it is recieved
        - in-place
        - stable
    Disadvantages:
        - quadratic time complexity
    Time Complexity:
        - worst:   O(n^2)
        - average: O(n^2)
        - best:    O(n)
    Space Complexity:
        - O(n)
    """
    temp = l[:]
    size = len(temp)
    for i in range(1, size):
        for j in range(i, 0, -1):
            # iterate in reverse until element l[j] >= l[j-1]
            if temp[j] < temp[j-1]:
                # if elements are out of order, swap them
                temp[j-1], temp[j] = temp[j], temp[j-1]
            else:
                break
    return temp

if __name__ == '__main__':
    # test cases
    l = list(range(10, 0, -1))
    print('Unsorted list: ' + str(l));
    l = insertion_sort(l)
    print('Sorted list: ' + str(l))


