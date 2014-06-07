package catalan

func Direct(n int) int {
	return fact(2*n) / (fact(n+1) * fact(n))
}

func Binomial(n int) int {
	if n == 0 {
		return 1
	}

	return binomialCoeff(2*n, n) - binomialCoeff(2*n, n-1)
}

func Sum(n int) (sum int) {
	for i := 0; i <= n; i++ {
		v := binomialCoeff(n, i)
		sum += v * v
	}
	return
}

func binomialCoeff(n, k int) int {
	return fact(n) / (fact(n-k) * fact(k))
}

func fact(n int) int {
	if n <= 1 {
		return 1
	}

	return n * fact(n-1)
}
