#include <iostream>

using namespace std;

void fib(int num){
	unsigned long current = 1;
	unsigned long prev = 0;
	unsigned long prev_ = current;
	for(int i = 0; i < num; i++){
		cout << current << " ";
		prev_ = prev;
		prev = current;
		current = prev + prev_;
	}
}


int main(){

	cout << "This program prints out the fibonacci series" << endl;
	cout << "Please enter the number of terms to be generated" << endl;

	int num;
	cin >> num;
	cout << endl << endl;
	fib(num);

	cout << endl << endl << endl;


	return 0;
}
