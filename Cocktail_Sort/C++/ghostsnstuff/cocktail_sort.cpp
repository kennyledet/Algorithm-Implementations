/*
Cocktail Sort (bidirectional bubble sort)
-----------------------------------------
Advantages:
    - stable
    - in-place
Disadvantages:
    - slow for large data sets
Time Complexity:
    - worst:   O(n^2)
    - average: O(n^2)
    - best:    O(n)
Stuff:
    - @ghostsnstuff
    - 1400087249053
*/

#include<iostream>
#include<vector>
using std::cout;
using std::endl;
using std::vector;

template<typename T>
void print(vector<T> l) {
  for (int i=0; i<l.size(); i++) {
    cout << l[i] << " ";
  }
  cout << endl;
}

template<typename T>
vector<T> cocktailSort(vector<T> l) {
  bool swapped = false;
  do {
    for(int i=0; i<l.size()-2; i++) {
      if(l[i] > l[i+1]) {
        int temp = l[i];
        l[i] = l[i+1];
        l[i+1] = temp;
        swapped = true;
      }
    }
    if(!swapped) {
      break;
    }
    swapped = false;
    for(int i=l.size()-2; i>0; i--) {
      if(l[i] > l[i+1]) {
        int temp = l[i];
        l[i] = l[i+1];
        l[i+1] = temp;
        swapped = true;
      }
    }
  } while(swapped);
  return l;
}

int main() {
  // Testing
  vector<int> l;
  for(int i=10; i>0; i--) {
    l.push_back(i);
  }
  cout << "Unsorted list: ";
  print(l);
  l = cocktailSort(l);
  cout << "Sorted list:   ";
  print(l);
  return 0;
}
