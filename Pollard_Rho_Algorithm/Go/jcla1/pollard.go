package pollard

import (
	"math"
)

func DefaultPollard(n int) int {
	return Pollard(n, defaultFunc)
}

func defaultFunc(x, n int) int {
	return (x*x - 1) % n
}

func Pollard(n int, f func(int, int) int) int {
	x, y, d := 2, 2, 1
	for d == 1 {
		x = f(x, n)
		y = f(f(x, n), n)
		d = gcd(int(math.Abs(float64(x-y))), n)
	}

	if n == d {
		return -1
	}

	return d
}

func gcd(a, b int) int {
	if b == 0 {
		return a
	}
	return gcd(b, a%b)
}
