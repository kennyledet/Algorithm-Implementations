module mergesort;

import std.stdio;

pure bool isSorted(T)(T[] data) {
	for (int i = 0; i < data.length - 1; ++i) {
		if (data[i] > data[i + 1]) {
			return false;
		}
	}

	return true;
}

unittest {
	int[] data = [5, 4, 2, 6, 2, 9, 5, 2, 0, 2, 9, 7];
	mergeSort(data);
	assert(isSorted(data));
}

public pure void mergeSort(T)(T[] data) {
	T[] aux = new T[data.length];
	mergeSort(data, aux);
}

private pure void mergeSort(T)(T[] data, T[] aux) {
	if (data.length == 1) {
		return;
	}

	mergeSort(data[0..$/2], aux);
	mergeSort(data[$/2..$], aux);
	merge(data[0..$/2], data[$/2..$], aux);
}

private pure void merge(T)(T[] left, T[] right, T[] aux)
in {
	debug { writeln(left, right); }
	assert(isSorted(left)); 
	assert(isSorted(right)); 	
} out { 
	debug { writeln(aux[0..(left.length + right.length)]); }
	assert(isSorted(aux[0..(left.length + right.length)])); 		
} body {	
	if (left[$ - 1] < right[0]) {
		return;
	}

	immutable ulong size = left.length + right.length;

	int i = 0;
	int l = 0;
	int r = 0;	
	
	while (l < left.length && r < right.length) {
		if (left[l] < right[r]) {
			aux[i++] = left[l++];
		} else {
			aux[i++] = right[r++];
		}
	}

	if (l == left.length) {
		aux[i..size] = right[r..$];		
	} else {
		aux[i..size] = left[l..$];
	}

	left[] = aux[0..left.length];
	right[] = aux[left.length..size];	
}
