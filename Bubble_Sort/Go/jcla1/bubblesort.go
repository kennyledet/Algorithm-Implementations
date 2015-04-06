package bubblesort

func BubbleSort(l []int) []int {
	size := len(l)
	swapped := true

	// Remove the following and change parameter
	// to enable side-effects
	arr := make([]int, size)
	copy(arr, l)

	for swapped {
		swapped = false
		for i := 1; i < size; i++ {
			if arr[i-1] > arr[i] {
				arr[i], arr[i-1] = arr[i-1], arr[i]
				swapped = true
			}
		}
	}

	return arr
}
