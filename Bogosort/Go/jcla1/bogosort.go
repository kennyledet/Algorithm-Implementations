package bogosort

import "math/rand"

func Bogosort(arr []int) []int {
	for !isSorted(arr) {
		fisherYates(arr)
	}

	return arr
}

func isSorted(arr []int) bool {
	for i := 1; i < len(arr); i++ {
		if arr[i-1] > arr[i] {
			return false
		}
	}

	return true
}

// This function is just for shuffling,
// not part of the actual algorithm
func fisherYates(arr []int) []int {
	m := len(arr)
	var i int

	for m != 0 {
		i = rand.Intn(m)
		m -= 1
		arr[i], arr[m] = arr[m], arr[i]
	}

	return arr
}
