#include<iostream>
#include<sstream>
#include<string>
#include<cassert>
#include "string_to_int.hpp"

using namespace std;

int main(){
    string str[10] = {"12","23","123","768","892","445123","12389","123456","9871","987654321"};

    int sol[10] = {12,23,123,768,892,445123,12389,123456,9871,987654321};

    for(int i=0; i<10; ++i){
        assert(string_to_int(str[i]) == sol[i]);
    }
    cout<<"Tested passed!"<<endl;
    return 0;

}
