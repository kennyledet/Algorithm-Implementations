/*
Quicksort (partition-exchange sort)
----------
Advantages:
    - Fast for large data sets
Disadvantages:
    - Not stable
Time complexity:
    - worst:   O(n^2)
    - average: O(n*log(n))
    - best:    O(n*log(n))
Space complexity:
    - Ideally O(log n)
    - This implementation O(n)
*/

#include <iostream>
#include <vector>
#include <stdlib.h>
#include <time.h>

using std::cout;
using std::vector;
using std::endl;

template<typename T>
void print(vector<T> l) {
    for (int i=0; i < l.size(); i++) {
        cout << l[i] << " ";
    }
    cout << endl;
}

template<typename T>
vector<T> extend(vector<T> v, vector<T> v_prime) {
    v.reserve(v.size() + distance(v_prime.begin(), v_prime.end()));
    v.insert(v.end(), v_prime.begin(), v_prime.end());
    return v;
}

template<typename T>
vector<T> quicksort(vector<T> array) {
    if (array.size() <= 1) {
        return array;
    }
    int pivot_index = rand() % array.size();
    T pivot = array[pivot_index];
    array.erase(array.begin() + pivot_index);
    vector<T> less;
    vector<T> greater;
    for (int i = 0; i < array.size(); i++) {
        if (array[i] <= pivot) {
            less.push_back(array[i]);
        } else {
            greater.push_back(array[i]);
        }
    }
    less = quicksort(less);
    less.push_back(pivot);
    greater = quicksort(greater);
    vector<T> result = extend(less, greater);
    return result;
}

//test cases
int main() {
    srand(time(0));
    vector<int> l = {10, 9, 8, 7, 6, 5, 4, 3, 2, 1};
    cout << "Unsorted list: ";
    print(l);
    l = quicksort(l);
    cout << "Sorted list: ";
    print(l);
}


