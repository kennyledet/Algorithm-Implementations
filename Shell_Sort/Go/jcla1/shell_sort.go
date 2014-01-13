package shellSort

func ShellSort(arr []int) []int {
	h := len(arr) / 2
	var val, i int

	for h > 0 {
		for j := h; j < len(arr); j++ {
			val = arr[j]
			i = j

			for i >= h && arr[i-h] > val {
				arr[i] = arr[i-h]
				i -= h
			}

			arr[i] = val
		}

		h /= 2
	}
	return arr
}
