package selectionSort

func SelectionSort(arr []int) []int {
	length := len(arr)
	var minIndex int

	for i := range arr {
		minIndex = i
		for j := i; j < length; j++ {
			if arr[j] < arr[minIndex] {
				minIndex = j
			}
		}
		if minIndex != i {
			arr[i], arr[minIndex] = arr[minIndex], arr[i]
		}
	}
	return arr
}
