def countSort(a):
    k = max(a)+1
    count = [0]*k

    # calculate the histogtam of key frequencies
    for x in a:
        count[x] += 1

    # calculate the starting index for each key
    total = 0
    for i in range(k):
        oldCount = count[i]
        count[i] = total
        total += oldCount

    # copy to output array, preserving order of inputs with equal keys
    output = [0]*len(a)
    for x in a:
        output[count[x]] = x
        count[x] += 1

    return output


if __name__ == '__main__':
    a = [3,8,25,11,1,31,6,3,11]
    print "Unsorted list: ", a
    a = countSort(a)
    print "Sorted list: ", a
