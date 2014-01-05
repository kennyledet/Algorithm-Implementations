package fisherYates

import (
	"math/rand"
)

// Make sure you seed the PRNG before using this function
// Fisher-Yates shuffle runs in O(n) and uses O(1) space
func FisherYates(arr []int) []int {
	m := len(arr)
	var i int

	for m != 0 {
		i = rand.Intn(m)
		m -= 1
		arr[i], arr[m] = arr[m], arr[i]
	}

	return arr
}
