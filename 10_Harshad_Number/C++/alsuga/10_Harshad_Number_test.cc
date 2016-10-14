#include <vector>
#include <cassert>
#include <iostream>
#include "10_Harshad_Number.hpp"

using namespace std;

/*
 ** Testing with the 10-harshad numbers less than 200
 */

int main() {
  int it = 0;
  // Only in C++11, use the compiler flag " -std=c++11 "
  // See : https://en.wikipedia.org/wiki/C%2B%2B11#Initializer_lists
  vector<int> test = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 12, 18, 20, 21,
    24, 27, 30, 36, 40, 42, 45, 48, 50, 54, 60, 63, 70, 72, 80, 81,
    84, 90, 100, 102,108, 110, 111, 112, 114, 117, 120, 126, 132, 133,
    135, 140, 144, 150, 152, 153, 156, 162, 171, 180, 190, 192, 195,
    198, 200};

  for (int i = 1; i <= 200; ++i) {
    if (is_harshad(i)) {
      // check the answer
      assert(test[it++] == i);
    }
  }
  cout << "Test passed" << endl;
  return 0;
}
