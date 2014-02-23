/*
 * @author ghostsnstuff
 * @date 2/14/14
 * @description http://en.wikipedia.org/wiki/Euclidean_algorithm
 * @implementations division, subtraction, recursive
 */

#include <iostream>
using namespace std;

int gcd_division(int a, int b) {
  int temp = 0;
  while(b != 0) {
    temp = b;
    b = a % b;
    a = temp;
  }
  return a;
}

int gcd_subtraction(int a, int b) {
  while(a != b) {
    if(a > b) {
      a -= b;
    } else {
      b -= a;
    }
  }
  return a;
}

int gcd_recursive(int a, int b) {
  return (b == 0) ? a : gcd_recursive(b, a % b);
}

int main(int argc, const char * argv[]) {
  cout << "gcd_division(28, 14)     = " << gcd_division(28, 14) << endl; 
  cout << "gcd_subtraction(28, 14)  = " << gcd_subtraction(28, 14) << endl;
  cout << "gcd_recursive(28, 14)    = " << gcd_recursive(28, 14) << endl;
}
