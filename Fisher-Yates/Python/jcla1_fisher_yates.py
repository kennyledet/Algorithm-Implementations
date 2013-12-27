from random import randrange


# Note, this shuffle modifies the original array
def fisher_yates(arr):
    m = len(arr)

    while m:
        i = randrange(m)
        m -= 1
        arr[i], arr[m] = arr[m], arr[i]

    return arr

if __name__ == '__main__':
    arr = range(50)
    print fisher_yates(arr)