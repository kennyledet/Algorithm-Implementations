#include <iostream>
#include "99_Bottles_Problem.hpp"

using namespace std;

int main() {
  int max_bottles = 99, bottles = 99;
  string act = "";
  // zero is a false in C/C++
  while(bottles) {
    act = "";
    act += bottles_of_beer(bottles);
    act += " on the wall, ";
    act += bottles_of_beer(bottles);
    act += ".\n";
    act += "Take one down, pass it around, ";
    // substract before of send the variable
    // to te function
    act += bottles_of_beer(--bottles);
    act += " on the wall.";
    cout << act << endl;
  }
  act = "No more bottles of beer on the wall, no more bottles of beer.\n";
  act += "Go to the store and buy some more, ";
  act += bottles_of_beer(max_bottles);
  act += " on the wall.";
  cout << act << endl;
  return 0;
}
