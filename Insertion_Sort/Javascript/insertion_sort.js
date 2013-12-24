/*
Insertion Sort
--------------
Advantages:
    - simple implementation
    - efficient for small data sets
    - efficient at sorting partially sorted datasets
    - can sort list as it is recieved
    - in-place
    - stable
Disadvantages:
    - quadratic time complexity
Time Complexity:
    - worst:   O(n^2)
    - average: O(n^2)
    - best:    O(n)
Space Complexity:
    - O(n)
*/

function insertion_sort(l) {
    var copy = l;
    var size = copy.length;
    for (var i = 1; i < size; i++) {
        for (var j = i; j > 0; j--) {
            // iterate in reverse until element copy[j] >= copy[j-1]
            if (copy[j] < copy[j-1]) {
                // if elements are out of order,
                // swap them using a temporary variable
                var temp = copy[j-1];
                copy[j-1] = copy[j];
                copy[j] = temp;
            } else {
                break
            }
        }
    }
    return copy;
}

// Testing
var l = [10, 9, 8, 7, 6, 5, 4, 3, 2, 1];
console.log("Unsorted list: ", l);
l = insertion_sort(l);
console.log("Sorted list: ", l);