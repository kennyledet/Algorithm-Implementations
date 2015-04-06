/*
Factorial
-----------
Author: ghostsnstuff
Date: March 22, 2014
Properties:
  - the product of all positive integers less than or equal to n
  - recursive
  - n must be >= 0
Test: 5! = 120
*/
#include <iostream>
using namespace std;

unsigned factorial(int n) {
  if(n == 0) {
    return 1;
  } else {
    return n * factorial(n-1);
  }
}

int main() {
  cout << "5! = 5 * 4 * 3 * 2 * 1 = " << factorial(5) << endl;
}
