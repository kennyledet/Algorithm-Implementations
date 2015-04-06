#include <stdio.h>
#include <math.h>
#define N 1000000

void sieve(int *numbers){
    int limit = (int)floor(sqrt(N));

    int i;
    for(i = 2; i <= limit; i++){
        int j, k; 
        j = k = 0;
        while(1){
            j = ((int)pow(i, 2)) + (k++ * i);
            if(j <= N){
                numbers[j] = 0;
            }else{
                break;
            }
        }
    }
}

int main(){
    /*
     * Initialize the array with truth
     * 0 -> false
     * 1 -> true
     */
    int primes[N] = {0};
    int i;
    for(i = 2; i <= N; i++){ primes[i] = 1; }
    
    // Call to the function with N numbers
    sieve(primes);

    /*
     * Funny test
     * 1 = Pass
     * 0 = Failure
     */
    printf("When search the number 2 as a prime: %d\n", primes[2]);
    printf("When search the number 137 as a prime: %d\n", primes[137]);
    printf("When search the number 233 as a prime: %d\n", primes[233]);
    printf("When search the number 997 as a prime: %d\n", primes[997]);
    // With !primes[0] I mean, not prime
    printf("When search the number 0 as a prime: %d\n", !primes[0]);
    printf("When search the number 1 as a prime: %d\n", !primes[1]);

    // Count the primes
    int count = 0;
    for(i = 2; i <= N; i++){ 
        // Is prime
        if(primes[i]){
            count++;
        }
    }
    printf("How many primes there are in %d: %d", N, count);


    return 0;
}
