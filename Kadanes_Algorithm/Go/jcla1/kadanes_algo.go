package kadane

func MaxSubarray(arr []int) int {
	if len(arr) < 1 {
		return 0
	}

	currentMax, maxSoFar := arr[0], arr[0]

	for _, v := range arr[1:] {
		currentMax = max(currentMax+v, v)
		maxSoFar = max(currentMax, maxSoFar)
	}

	return maxSoFar
}

func max(a, b int) int {
	if a > b {
		return a
	}

	return b
}
