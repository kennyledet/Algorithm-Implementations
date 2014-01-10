#include <stdio.h>
// Size of the array
#define N 6

/**
 * Count the length of an Array of characters
 * wich is a String,
 *
 * @param   char    *string The array of chaacters
 * @return  int     count   The length of the array
 */
int length(char *string){
    int count  = 0; 
    while(string[count++] != '\0'); 
    return --count;
}

/**
 * Exponentiation without a library
 *
 * @param   int base    the number base
 * @param   int exp     the exponentiation number
 * @return  int total   the total of the exponentiation
 */
int exponentiation(int base, int exp){
    if(!exp){
        return 1;
    }

    int total = base;
    int i = 1;

    while(i++ < exp){
        total *= base;
    }
    return total;
}

/**
 * Parse the string to a number type
 *
 * @param   char    *number the array of numbers
 * @param   int     total   the total number
 */
int parse(char *number){
    int size = length(number);
    int exp = size - 1;
    int total = 0;
    int i;
    
    for(i = 0; i < size; i++){
        if(number[i] >= '0' && number[i] <= '9'){
            total += (number[i] - 48) * exponentiation(10, exp--);
        }
    }
    return total;
}

int main(){

    char a[N] = "12345";
    char b[N] = "32442";

    /**
     * Test for the parser
     * 1 pass
     * 0 Failure
     */
    printf("%d\n", 12345 == parse(a));
    printf("%d\n", 32442 == parse(b));

    return 0;
}
