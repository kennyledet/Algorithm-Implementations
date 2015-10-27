#include <iostream>
#include <vector>
#include <cassert>
#include "happy_number.hpp"

using namespace std;

int main() {
  vector<int> happy = {1, 7, 10, 13, 19, 23, 28, 31, 32, 44, 49, 68, 70};
  for(int i = 0; i < happy.size(); ++i) {
    assert(is_happy_number(happy[i]) == true);
  }
  cout << "All test passed" << endl;
  return 0;
}
