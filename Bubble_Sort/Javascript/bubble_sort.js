//
// Bubble Sort
// -----------
// Advantages:
//     - stable
//     - in-place
// Disadvantages:
//     - slow for large data sets
// Time Complexity:
//     - worst:   O(n^2)
//     - average: O(n^2)
//     - best:    O(n)
// Space Complexity:
//     - O(1)
//

function bubble_sort(l) {
    // basic optimization to avoid unneeded checks
    // note that bubble_sort is the generic bad sorting algorithm
    var copy = l;
    var size = copy.length;
    var sorted_list = false;
    var j = 0;
    while (!sorted_list) {
        var modified = false;
        for (var i = 0; i < (size - j); i++) {
            if (copy[i-1] > copy[i]) {
                var temp = copy[i-1];
                copy[i-1] = copy[i];
                copy[i] = temp;
                modified = true;
            }
        }
        if (!modified) {
            sorted_list = true;
            j += 1;
        }
    }
    return copy;
}

// Test cases
var l = [10, 9, 8, 7, 6, 5, 4, 3, 2, 1];
console.log('Unsorted list: ', l);
l = bubble_sort(l);
console.log('Sorted list: ', l);
