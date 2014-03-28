function linear_search(arr, key) {
    for (var i = arr.length - 1; i >= 0; i--) {
        if (arr[i] === key) return i;
    }

    return -1
}

// Note: This implementation returns the index
//       of the last element that equals the key.
function linear_search_functional(arr, key) {
    return arr.reduce(function(idx, val, new_index) {
        if (val === key) return new_index;
        return idx;
    }, -1)
}