function linear_search(arr, key) {
    for (var i = arr.length - 1; i >= 0; i--) {
        if (arr[i] == key) return i;
    }

    return -1
}