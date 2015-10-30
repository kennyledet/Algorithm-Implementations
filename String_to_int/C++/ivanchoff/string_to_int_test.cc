#include<iostream>
#include<cassert>
#include "string_to_int.hpp"

using namespace std;

/*
 *    Testing with 10 strings
 */

int main(){
    //string array for test
    std::string str[10] = {"12","99","123","768","892","445123","12389","123456","9871","987654321"};
    int sol[10] = {12,99,123,768,892,445123,12389,123456,9871,987654321};

    for(int i=0; i<10; ++i){
        //check returned value from string_to_int function
        assert(string_to_int(str[i]) == sol[i]);
    }
    cout<<"Tested passed!"<<endl;
    return 0;

}
