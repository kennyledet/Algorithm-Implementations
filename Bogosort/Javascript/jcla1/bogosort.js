// This implementation sorts the array in-place
function bogosort(arr) {
    while (!is_sorted(arr)) {
        fisher_yates(arr);
    }

    return arr;
}

function is_sorted(arr) {
    for (var i = 1; i < arr.length; i++) {
        if (arr[i] < arr[i-1]) return false;
    }
    return true;
}

// The following is not an actual part of the sorting algorithm
// This function is used for shuffling the array
function fisher_yates(a) {for(var b=a.length,d,c;b;)c=~~(Math.random()*b--),d=a[b],a[b]=a[c],a[c]=d;return a}