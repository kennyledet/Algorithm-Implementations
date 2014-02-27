#ifndef QUICKSORT
#define QUICKSORT

/*
Quicksort (partition-exchange sort)
----------
Advantages:
    - Fast for large data sets
Disadvantages:
    - Not stable
Time complexity:
    - worst:   O(n^2)
    - average: O(n*log(n))
    - best:    O(n*log(n))
Space complexity:
    - average: O(log n)
------------------
This implementation uses atomic swap in <algorithm.h> to implement the partition function in space.
*/

#include <vector>
#include <algorithm>
#include <iostream>
#include <cstdlib>
using namespace std;
//use atomic swap operation to implement partitions in-place.
//return the new pivot position.
template <typename T>
typename vector<T>::iterator mypartition(typename vector<T>::iterator start, typename vector<T>::iterator end, typename vector<T>::iterator pivot) {
	//make sure the range is correct
	if (start >= end || pivot >= end || pivot < start) return start;

	//first swap the pivot to the start position:
	swap(*start, *pivot);
	pivot = start;
	typename vector<T>::iterator index = end - 1;
	/*loop invariant: 
	Every item before the pivot is smaller than the pivot
	Every item after the index is larger than the pivot
	*/
	while (index > pivot) {
		if (*index >= *pivot) index = index - 1;
		else {
		//implement the repositioning through two swap operations.
			swap(*(pivot + 1), *index);
			swap(*pivot, *(pivot + 1));
			pivot = pivot + 1;
		}
	}
	return pivot;
} 

template <typename T>
void quicksort(typename vector<T>::iterator start, typename vector<T>::iterator end) {
	//make sure the range is correct, also serves as the base case.
	if (start >= end) return;

	//randomly choose a pivot position
	typename vector<T>::iterator pivot = start + rand() % (end - start);
	//partition, then recursively call.
	pivot = mypartition<T>(start, end, pivot);
	quicksort<T>(start, pivot);
	quicksort<T>(pivot + 1, end);
}



#endif
