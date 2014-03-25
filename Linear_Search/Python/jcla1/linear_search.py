def linear_search(arr, key):
    for index, val in enumerate(arr):
        if val == key:
            return index
    return -1

if __name__ == '__main__':
    assert linear_search([5, 3, 7, 2, 9, 1], 7) == 2