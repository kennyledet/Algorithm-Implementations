#include <stdio.h>

void  bubble_sort(int *vector, int len){
    short done = 0;

    while(!done){
        done = 1;
        int i; 
        for(i = 0; i < len - 1; i++){
            if(vector[i] > vector[i+1]){
                int tmp = vector[i]; 
                vector[i] = vector[i+1]; 
                vector[i+1] = tmp;
                done = 0;
            }
        }
        len--;
    }
}

int main(){
    int numbers[12] = {1,4,6,8,3,0,3,45,123,345,0,4};
    int n = 12;
    // call to the function
    bubble_sort(numbers, n);
    int i; 
    // test order
    for( i = 0; i < n; i++){
        printf(" %d ", numbers[i]);
    }

    return 0;
}
