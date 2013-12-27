from random import randrange


# Note, this shuffle modifies the original array
def fisher_yates(arr):
    m = len(arr) - 1

    while m:
        i = randrange(m)
        arr[i], arr[m] = arr[m], arr[i]
        m -= 1

    return arr

if __name__ == '__main__':
    arr = range(50)
    print fisher_yates(arr)