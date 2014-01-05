#include <stdio.h>
#define BSEARCH_NOT_FOUND -1;

typedef int TypeArray;

int BinarySearch(TypeArray a[], TypeArray key, int first, int last)
{
    //return not found if a is empty
    if (first > last) return BSEARCH_NOT_FOUND;

    int length = last - first + 1;
    int midIndex = (first + last) / 2;
    TypeArray midValue = a[midIndex];

    if (key > midValue)
    {
        return BinarySearch(a,key,midIndex+1,last);
    }
    else if (key < midValue)
    {
        return BinarySearch(a,key,first,midIndex-1);
    }
    else return midIndex;
}

void BinarySearchTest()
{
    int value = 5;
    int containingLast[] = {-1,1,2,3,4,5};
    int containingFirst[] = {5,6,7};
    int containingMiddle[] = {1,2,3,4,5,6,7,8,9};
    int containingOnly[] = {5};
    int notContaining[] = {1,4,100,1234};
    int allGreater[] = {6,7,8};
    int allLess[] = {1,2,3,4};
    int emptyArray[] = {};

    printf("should be 0: %d\n",BinarySearch(containingFirst,value,0,sizeof(containingFirst)/sizeof(TypeArray)-1));
    printf("should be 5: %d\n", BinarySearch(containingLast,value,0,sizeof(containingLast)/sizeof(TypeArray)-1));
    printf("should be 4: %d\n", BinarySearch(containingMiddle,value,0,sizeof(containingMiddle)/sizeof(TypeArray)-1));
    printf("should be 0: %d\n", BinarySearch(containingOnly,value,0,sizeof(containingOnly)/sizeof(TypeArray)-1));
    printf("should be -1: %d\n", BinarySearch(notContaining,value,0,sizeof(notContaining)/sizeof(TypeArray)-1));
    printf("should be -1: %d\n", BinarySearch(allGreater,value,0,sizeof(allGreater)/sizeof(TypeArray)-1));
    printf("should be -1: %d\n", BinarySearch(allLess,value,0,sizeof(allLess)/sizeof(TypeArray)-1));
    printf("should be -1: %d\n", BinarySearch(emptyArray,value,0,sizeof(emptyArray)/sizeof(TypeArray)-1));
}

int main()
{
    BinarySearchTest();
    return 0;
}
