def selection_sort(l):
    length = len(l)
    for i in range(length):
        min_index = i
        for j in range(i, length):
            if l[j] < l[min_index]:
                min_index = j
        if min_index != i:
            l[i], l[min_index] = l[min_index], l[i]
    return l

if __name__ == '__main__':
    # test cases
    l = list(range(10, 0, -1))
    print('Unsorted list: ' + str(l));
    l = selection_sort(l)
    print('Sorted list: ' + str(l))
