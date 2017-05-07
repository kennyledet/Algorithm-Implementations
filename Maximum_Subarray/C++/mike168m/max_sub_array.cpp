#include <algorithm>
#include <iostream>
#include <vector>

template<typename T>
T kadane_method(const std::vector<T>& v){
	T ret = 0;
	std::for_each(v.begin(), v.end(), [c_max = 0, max = 0, &ret](T m) mutable {
		c_max  = c_max + m;
		// the ccurrent max is a negative number,
		// we can't use that cuz it will not give us
		// the maximum sum
		if (c_max < 0) c_max = 0;
		// we have to check if there is a new max
		// if c_max is greater than it means there is a new max so we 
		// have to use that instead.
		if (max < c_max) max = c_max;

		//std::cout << "m: " << m << " c_max: " 
		//			<< c_max << " max: " << max << '\n';
		ret = max; 
	});

	return ret;
}

int main() {
	std::cout << kadane_method<int>({-2, -3, 4, -1, -2, 1, 5, -3}) << '\n';
	std::cout << kadane_method<int>({-2, 1, -3, 4, -1, 2, 1, -5, 4}) << '\n';
	std::cout << kadane_method<int>({2, 3, 7, -5, -1, 4, -10}) << '\n';
}