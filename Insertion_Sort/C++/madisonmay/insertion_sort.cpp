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

#include <iostream>
#include <vector>
using std::cout;
using std::vector;
using std::endl;

template<typename T>
void print(vector<T> l) {
    for (int i=0; i<l.size(); i++) {
        cout << l[i] << " ";
    }
    cout << endl;
}

template<typename T>
vector<T> insertion_sort(vector<T>& l) {
    //pass by reference is crucial
    vector<T> copy = l;
    int size = copy.size();
    for (int i = 1; i < size; i++) {
        for (int j = i; j > 0; j--) {
            // iterate in reverse until element this[j] >= this[j-1]
            if (copy[j] < copy[j-1]) {
                // if elements are out of order,
                // swap them using a temporary variable
                T temp = copy[j-1];
                copy[j-1] = copy[j];
                copy[j] = temp;
            } else {
                break;
            }
        }
    }
    return copy;
}


int main() {
    // Testing
    const int a[] = {10, 9, 8, 7, 6, 5, 4, 3, 2, 1};
    vector<int> l (a, a + sizeof(a) / sizeof(a[0]));
    cout << "Unsorted list: ";
    print(l);
    l = insertion_sort(l);
    cout << "Sorted list: ";
    print(l);
    return 0;
}