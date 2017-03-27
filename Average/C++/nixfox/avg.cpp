#include <iostream>
#include <list>
template <typename T>
T average(T const* nums, int range){
	T sum = nums[range-1];
	for(unsigned int i = 0; i < (range-1); i++){
		sum += nums[i];
	}
	return sum / range;
}
int main(){
	// ints
	int nums_i[] = {1,2,3,40,5,6,7,8,100,560,2136};
	std::cout << average(nums_i,sizeof(nums_i)/sizeof(int))<<std::endl;
	// floats
	float nums_f[] = {20.60,45.213,23.78,90.04,29,01};
	std::cout << average(nums_f, sizeof(nums_f)/sizeof(float))<<std::endl;
}

