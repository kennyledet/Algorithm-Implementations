/*
Bubble Sort
-----------
Advantages:
    - stable
    - in-place
Disadvantages:
    - slow for large data sets
Time Complexity:
    - worst:   O(n^2)
    - average: O(n^2)
    - best:    O(n)
Space Complexity:
    - O(1)
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
vector<T> bubble_sort(vector<T> l) {
    // basic optimization to avoid unneeded checks
    // note that bubble_sort is the generic bad sorting algorithm
    vector<T> copy = l;
    int size = copy.size();
    bool sorted_list = false;
    int j = 0;
    while (!sorted_list) {
        bool modified = false;
        for (int i = 0; i < (size - j); i++) {
            if (copy[i-1] > copy[i]) {
                T temp = copy[i-1];
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

int main() {
    // Testing
    vector<int> l = {10, 9, 8, 7, 6, 5, 4, 3, 2, 1};
    cout << "Unsorted list: ";
    print(l);
    l = bubble_sort(l);
    cout << "Sorted list: ";
    print(l);
    return 0;
}
