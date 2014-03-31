#include <stdio.h>
#include <assert.h>

int linear_search(int arr[], int size, int element);

int linear_search(int arr[], int size, int element)
{
    for(int i=0;i<size;i++){
        if(arr[i] == element)
        {
            return i;
        }
    }

    return -1;
}

void linear_search_test(){
	// testing for an empty array
    int empty[] = {};
    int empty_size = sizeof(empty)/sizeof(int);
	
	//testing for a specific element
    int a[] = {1, 3, 4, 8, 6};
    int a_size = sizeof(a)/sizeof(int);

    assert(linear_search(empty, empty_size, 3) == -1);
    assert(linear_search(a, a_size, 3) == 1);

    printf("Should return -1 = %d\n", linear_search(empty, empty_size, 3));
    printf("Should return 1 = %d\n", linear_search(a, a_size, 3));
}

int main()
{
    linear_search_test();
    return 0;
}