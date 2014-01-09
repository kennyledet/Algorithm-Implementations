package quickSort

import "math/rand"

func QuickSort(arr []int) []int {
	if len(arr) < 2 {
		return arr
	}

	pivotIndex := rand.Intn(len(arr))
	pivot := arr[pivotIndex]

	arr = append(arr[:pivotIndex], arr[pivotIndex+1:]...)
	less, greater := make([]int, 0), make([]int, 0)

	for _, v := range arr {
		if v < pivot {
			less = append(less, v)
		} else {
			greater = append(greater, v)
		}
	}

	// Merge the recursively sorted slices back together
	return append(append(QuickSort(less), pivot), QuickSort(greater)...)
}
