// Union Find Disjoint Set implementation

#include<iostream>
#include<vector>
#include<cassert>
#include "unionFind.h"


int main() {

  vector<int> pset;

  //number of elements
  int N = 10;

  // init set
  initSet(N, pset);
  assert(isSameSet(3,4,pset) == false);
  cout<<"is in same set 3 and 4 ? : ";
  cout<<((isSameSet(3, 4, pset))? "Yes" : "No")<<endl;
  cout<<"union Set 3 and 4"<<endl;

  // union Set 3 with 4
  unionSet(3,4,pset);

  assert(isSameSet(3,4,pset) == true);
  cout<<"is in same set 3 and 4 ? : ";
  cout<<((isSameSet(3, 4, pset))? "Yes" : "No")<<endl;

  return 0;
}
