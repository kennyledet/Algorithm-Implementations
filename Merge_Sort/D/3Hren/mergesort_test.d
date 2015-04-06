import std.random;
import std.conv;
import std.stdio;

import mergesort;

int main(string[] args) {
	if (args.length != 2) {
		writeln("Usage: mergesort N");
		return 1;
	}

	immutable int N = to!int(args[1]);	
	int[] data = new int[N];
	for (int i = 0; i < N; i++) {
		data[i] = uniform(0, N);
	}
	mergeSort(data);
	assert(isSorted(data));
	return 0;
}
