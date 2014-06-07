package catalan

func Direct(n int) int {
	return fact(2*n) / (fact(n+1) * fact(n))
}

func fact(n int) int {
	if n <= 1 {
		return 1
	}

	return n * fact(n-1)
}
