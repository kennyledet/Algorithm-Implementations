#include <iostream>
#include <algorithm>
#include <random>
#include <chrono>
#include <iterator>

/**
* bogo sort an array
* 1. Check if array is sorted
* 2. Shuffle the arry if not, stop otherwise
* 3. Repeat
*/

template<typename T>
static bool is_sorted(T *array, int number_of_elements);

template<typename T>
static void bogo_sort(T *array , int number_of_elements) {
	while(!is_sorted<int>(array, number_of_elements)) {
		unsigned seed = std::chrono::system_clock::now().time_since_epoch().count();
		std::shuffle(array, array+number_of_elements, std::default_random_engine(seed));
	}
}

template<typename T>
static bool is_sorted(T *array, int number_of_elements) {
	int iter;
	for(iter=1;iter<number_of_elements;iter++) {
		if(array[iter]<array[iter-1]) {
			return false;
		}
	}
	return true;
}

int main()
{
	const int MAX_ELEMENTS = 10;
	int list[MAX_ELEMENTS];

	int i = 0;

	srand(time(NULL));
	// generate random numbers and fill them to the list
	for(i = 0; i < MAX_ELEMENTS; i++ ){
		list[i] = rand()%100;
	}
	printf("The list before sorting is:\n");
	std::copy(list, list+MAX_ELEMENTS, std::ostream_iterator<int>(std::cout, " "));
	std::cout<<std::endl;

	// sort the list using bogo sort
	bogo_sort<int>(&list[0],MAX_ELEMENTS);  

	// print the result
	printf("The list after sorting using bogo sort algorithm:\n");
	std::copy(list, list+MAX_ELEMENTS, std::ostream_iterator<int>(std::cout, " "));
	std::cout<<std::endl;
	return 0;
}
