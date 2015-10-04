#include <string>
#include <sstream>
#include <iostream>

using namespace std;

string bottles_of_beer(int n) {
  stringstream out;
  if(n == 1)
    out << "1 bottle";
  if(n == 0)
    out << "no more bottles";
  if(n > 1)
    out << n << " bottles";
  out << " of beer";
  return out.str();
}


