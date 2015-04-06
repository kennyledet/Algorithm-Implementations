/*
The Hamming distance between two strings of equal length is the number of positions at 
which the corresponding symbols are different.  

hamdist() function will compute the Hamming distance of two integers (considered as binary 
values, that is, as sequences of bits). The running time of this procedure is 
proportional to the Hamming distance rather than to the number of bits in the inputs.
*/

#include <stdio.h>

unsigned hamdist(unsigned x, unsigned y)
{
    unsigned dist = 0, val = x ^ y; // XOR

    // Count the number of set bits
    while(val)
    {
        ++dist; 
        val &= val - 1;
    }

    return dist;
}

int main() {
    /* Test integer values 
     * 7 and 2 i.e. 111 and 010 in binary, hamdist should be 2 
     * 4 and 3 i.e. 100 and 011 in binary, hamdist should be 3
     * 128 and 256, hamdist should be 2
     * 127 and 256, hamdist should be 8
     */
    printf("Hamming Distance between %d & %d is %d\n", 7, 2, hamdist(7, 2));
    printf("Hamming Distance between %d & %d is %d\n", 4, 3, hamdist(4, 3));
    printf("Hamming Distance between %d & %d is %d\n", 128, 256, hamdist(128, 256));
    printf("Hamming Distance between %d & %d is %d\n", 127, 256, hamdist(127, 256));
    return 0;
}
