package ackermann

func Compute(m, n int) int {
	if m == 0 {
		return n + 1
	} else if m > 0 && n == 0 {
		return Compute(m-1, 1)
	}

	return Compute(m-1, Compute(m, n-1))
}
