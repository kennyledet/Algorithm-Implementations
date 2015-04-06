#include <iostream>
#include <vector>

using namespace std;

static const int BSEARCH_NOT_FOUND = -1;

template <class T>
int BinarySearch(const vector<T> & a, const T & key)
{
    //return not found if a is empty
    if (a.empty()) return BSEARCH_NOT_FOUND;

    int midIndex = a.size() / 2;
    T midValue = a[midIndex];

    if (key > midValue)
    {
        int r = BinarySearch(vector<T>(a.begin()+midIndex+1,a.end()),key);

	//If r!=-1 (not found), r is the index relative to the subvector.
	//We sum midIndex+1 (the index to its first element) to get the index relative to the parent vector
	return r == -1 ? r : r+midIndex+1;
    }
    else if (key < midValue)
    {
        return BinarySearch(vector<T>(a.begin(),a.begin()+midIndex),key);
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

    cout << "fshould be 0: " << BinarySearch(vector<int>(containingFirst,containingFirst+sizeof(containingFirst)/sizeof(int)), value) << endl;
    cout << "lshould be 5: " << BinarySearch(vector<int>(containingLast,containingLast+sizeof(containingLast)/sizeof(int)), value) << endl;
    cout << "mshould be 4: " << BinarySearch(vector<int>(containingMiddle,containingMiddle+sizeof(containingMiddle)/sizeof(int)), value) << endl;
    cout << "oshould be 0: " << BinarySearch(vector<int>(containingOnly,containingOnly+sizeof(containingOnly)/sizeof(int)), value) << endl;
    cout << "nshould be -1: " << BinarySearch(vector<int>(notContaining,notContaining+sizeof(notContaining)/sizeof(int)), value) << endl;
    cout << "+should be -1: " << BinarySearch(vector<int>(allGreater,allGreater+sizeof(allGreater)/sizeof(int)), value) << endl;
    cout << "-should be -1: " << BinarySearch(vector<int>(allLess,allLess+sizeof(allLess)/sizeof(int)), value) << endl;
    cout << "eshould be -1: " << BinarySearch(vector<int>(emptyArray,emptyArray+sizeof(emptyArray)/sizeof(int)), value) << endl;
}

int main()
{
    BinarySearchTest();
    return 0;
}
