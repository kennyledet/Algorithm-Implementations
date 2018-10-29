#include<bits/stdc++.h>

using namespace std;

bool isPalindrome(string cad){
  int len = cad.size();
  for(int i=0; i<len/2; i++) {
    if(cad[i] != cad[len-i-1])
      return false;
  }
  return true;
}

int main(){
  vector<string> test={"ana","anna","hello", "alula"};;
  string cad;
  for(int i=0; i<test.size(); ++i) {
    cad = test[i];
    cout<<"is '"<<cad<<"' palindrome? "<<(isPalindrome(cad)? "Yes": "No")<<endl;
  }
  return 0;
}
