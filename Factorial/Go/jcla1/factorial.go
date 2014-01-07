package factorial

func Factorial(n int) int {
	if n <= 1 {
		return 1
	} else {
		return Factorial(n-1) * n
	}
}

// This function can be tail-call optimized
// Use: FactorialTailRecursive(n, 1) to get
//      the factorial of n
func FactorialTailRecursive(n, acc int) int {
	if n <= 1 {
		return acc
	} else {
		return FactorialTailRecursive(n-1, acc*n)
	}
}

// This function does no recurse, so it
// can't cause a stack-overflow
func FactorialIterative(n int) int {
	if n <= 1 {
		return 1
	}

	fac := 1
	for ; n >= 1; n-- {
		fac *= n
	}

	return fac
}

// This is an analytical approximation
// See: http://www.evanmiller.org/mathematical-hacker.html
func FactorialAnalytical(n int) int {
	return int(math.Gamma(float64(n + 1)))
}
