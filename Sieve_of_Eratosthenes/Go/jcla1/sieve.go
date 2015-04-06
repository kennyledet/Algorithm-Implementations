package main

import "math"

// Takes a limit and returns the
// number of primes below that limit
func Sieve(n int) int {
	// We use false for prime and
	// true for non-prime values in arr
	arr := make([]bool, n)
	for i := range arr {
		arr[i] = true
	}

	limit := int(math.Sqrt(float64(n)))

	for i := 2; i <= limit; i++ {
		if arr[i] {
			for j := i * i; j < n; j += i {
				arr[j] = false
			}
		}
	}

	counter := 0
	for _, p := range arr {
		if p {
			counter += 1
		}
	}

	// Account for numbers 0 & 1 being in the array
	return counter - 2
}
