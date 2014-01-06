package insertionSort

// Works in-place
// Avg time complexity: O(n^2)
func InsertionSort(arr []int) []int {
	for i := 1; i < len(arr); i++ {
		for j := i; j > 0; j-- {
			if arr[j] < arr[j-1] {
				// swap the elements
				arr[j], arr[j-1] = arr[j-1], arr[j]
			} else {
				break
			}
		}
	}

	return arr
}
