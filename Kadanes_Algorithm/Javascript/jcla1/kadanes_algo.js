function max_subarray(arr) {
    if (arr.length < 1) return 0;

    var cur_max = arr[0],
        max_so_far = arr[0];

    for (var i = 1; i < arr.length; i++) {
        cur_max = max(cur_max + arr[i], arr[i]);
        max_so_far = max(cur_max, max_so_far);
    }

    return max_so_far;
}

function max() {
    var cur_max = arguments[0];

    for (var i = 1; i < arguments.length; i++) {
        if (arguments[i] > cur_max) {
            cur_max = arguments[i]
        }
    }

    return cur_max
}