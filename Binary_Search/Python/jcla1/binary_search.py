# Expects the array to be sorted
def binary_search(arr, target):
    if len(arr) < 1:
        return -1

    middle = int(len(arr) / 2)
    middle_value = arr[middle]

    if middle_value > target:
        return binary_search(arr[:middle], target)
    elif middle_value < target:
        v = binary_search(arr[middle + 1:], target)
        # since we're jumping forward in the slice (arr[middle+1:])
        # we need to compensate that by adding the jump size
        if v < 0:
            return v
        else:
            return middle + v + 1

    return middle
