#include <iostream>
#include <cassert>
#include "ackermann.hpp"

using namespace std;

int main() {
  // based on https://en.wikipedia.org/wiki/Ackermann_function#Table_of_values
  assert(ackermann(0, 2) == 3);
  assert(ackermann(0, 5) == 6);

  assert(ackermann(0, 0) == 1);
  assert(ackermann(2, 0) == 3);
  assert(ackermann(5, 0) == 65533);

  assert(ackermann(3, 4) == 125);
  assert(ackermann(4, 1) == 65533);
  
  cout << "All test passed" << endl;
  return 0;
}
