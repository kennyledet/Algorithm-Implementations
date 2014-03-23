/**
  * Euclidean Norm 
  * --------------
  * Author: ghostsnstuff
  * Date: March 23, 2014
  * Source: http://en.wikipedia.org/wiki/Norm_(mathematics)#Euclidean_norm
  * Logic: square each element in the vector -> summate all squared values -> take the square root of the sum
  */
#include <iostream>
#include <vector>
#include <math.h>
using namespace std;

double EuclideanNorm(vector<int> v) {
  double sum = 0.0;
  for(int i = 0; i < v.size(); i++) {
    sum += v[i] * v[i];
  }
  return sqrt(sum);
}

int main() {
  vector<int> vec;
  for(int i = 1; i < 5; i++) {
    vec.push_back(i);
  }
  cout << EuclideanNorm(vec) << endl;
}
