/*
Merge Sort
----------
Advantages:
    - Relatively fast for large data sets
    - Stable
Disadvantages:
    - Not in-place
Time complexity:
    - worst:   O(n*log(n))
    - average: O(n*log(n))
    - best:    O(n*log(n))
Space complexity:
    - O(n)
*/

#include <iostream>
#include <vector>
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
T pop_front(std::vector<T>& vec) {
    if (!vec.empty()) {
        T temp = vec[0];
        vec.erase(vec.begin());
        return temp;
    }
}

template<typename T>
void extend(vector<T>& v, vector<T>& v_prime) {
    v.reserve(v.size() + distance(v_prime.begin(), v_prime.end()));
    v.insert(v.end(), v_prime.begin(), v_prime.end());
}

template<typename T>
vector<T> merge(vector<T> left, vector<T> right) {
    vector<T> result = {};
    while (left.size() > 0 || right.size() > 0) {
        if (left.size() > 0 && right.size() > 0) {
            if (left[0] < right[0]) {
                result.push_back(pop_front(left));
            } else {
                result.push_back(pop_front(right));
            }
        } else if (left.size() > 0) {
            extend(result, left);
            break;
        } else {
            extend(result, right);
            break;
        }
    }
    return result;
}

template<typename T>
vector<T> merge_sort(vector<T> l) {
    if (l.size() <= 1) {
        return l;
    } else {
        int pivot = l.size()/2;
        vector<T> left = {};
        for (int i=0; i < pivot; i++) {
            left.push_back(l[i]);
        }
        left = merge_sort(left);
        vector<T> right = {};
        for (int i=pivot; i < l.size(); i++) {
            right.push_back(l[i]);
        }
        right = merge_sort(right);
        return merge(left, right);
    }
}


int main() {
    // Testing
    vector<int> l = {10, 9, 8, 7, 6, 5, 4, 3, 2, 1};
    cout << "Unsorted list: ";
    print(l);
    l = merge_sort(l);
    cout << "Sorted list: ";
    print(l);
}