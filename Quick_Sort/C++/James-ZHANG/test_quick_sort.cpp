/*
Test cases for quicksort
*/


#include "quick_sort.h"
#include <iostream>
#include <vector>
#include <cstdlib>
#include <ctime>
using namespace std;


int main() {
	srand(time(NULL));
	//a trivial test case
	int myintp[] = {6, 7, 8, 9, 10, 5, 0, 1, 2, 3, 4};
	vector<int> a(myintp, myintp + 11);
	quicksort<int>(a.begin(), a.end());
	for (int i = 0 ; i < a.size(); i++) cout<<a[i]<<' ';
	cout<<endl;

	//a large test case for randomly generated inputs
	vector<int> b(10000);
	for (int i = 0; i < b.size(); i++) b[i] = rand();
	quicksort<int>(b.begin(), b.end());
	for (int i = 0; i < b.size(); i++) cout<<b[i]<<' ';
	cout<<endl;

	return 0;
}
