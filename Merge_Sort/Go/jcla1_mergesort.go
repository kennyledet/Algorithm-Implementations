package mergesort

func Merge(left, right []int) []int {
	result := make([]int, 0, len(left)+len(right))

	for len(left) > 0 || len(right) > 0 {

		if len(left) > 0 && len(right) > 0 {
			if left[0] <= right[0] {
				result = append(result, left[0])
				left = left[1:]
			} else {
				result = append(result, right[0])
				right = right[1:]
			}
		} else if len(left) > 0 {
			result = append(result, left...)
			left = nil
		} else if len(right) > 0 {
			result = append(result, right...)
			right = nil
		}
	}

	return result
}

func MergeSort(arr []int) []int {
	l := len(arr)
	if l < 2 {
		return arr
	}
	return Merge(MergeSort(arr[:l/2]), MergeSort(arr[l/2:]))
}
