#include <stdio.h>

int gcd_division(int a, int b){
    while( b != 0 ){
        int tmp = a; 
        a  = b;
        b = tmp % b;
    }
    return a;
}

int gcd_substraction(int a, int b){
    while( a != b){
        if( a > b ){
            a = a -b; 
        }else{
            b = b -a;
        }
    }
    return a;
}

int gcd_recursive(int a, int b){
    return (b == 0) ? a : gcd_recursive(b, a % b);
}

int main(){
    
    /*
     * Some kind of test :) 
     * 1 = Pass
     * 0 = Failure
     */
    
    // GCD with division 
    printf("%d", gcd_division(210, 45) == 15);
    printf("%d", gcd_division(0, 0) == 0);
    printf("%d", gcd_division(20, 77) == 1);

    // GCD with substraction 
    printf("%d", gcd_substraction(210, 45) == 15);
    printf("%d", gcd_substraction(0, 0) == 0);
    printf("%d", gcd_substraction(20, 77) == 1);

    // GCD with recursive 
    printf("%d", gcd_recursive(210, 45) == 15);
    printf("%d", gcd_recursive(0, 0) == 0);
    printf("%d", gcd_recursive(20, 77) == 1);

    return 0; 
}
