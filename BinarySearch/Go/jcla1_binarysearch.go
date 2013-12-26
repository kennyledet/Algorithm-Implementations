package binarysearch

func BinarySearch(arr []int, target int) int {
	middle := len(arr) / 2
	// no need to carry on if there's nothing to search for
	if len(arr) < 1 {
		return -1
	}

	middleValue := arr[middle]

	if middleValue > target {
		return BinarySearch(arr[:middle], target)
	} else if middleValue < target {
		a := BinarySearch(arr[middle+1:], target)
		// since we're jumping forward in the slice (arr[middle+1:])
		// we need to compensate that by adding the jump size
		if a != -1 {
			return a + middle + 1
		} else {
			return a
		}
	}

	return middle
}
