package euclidean

func GCDDevision(a, b int) int {
	var tmp int

	for b != 0 {
		tmp = b
		b = a % b
		a = tmp
	}

	return a
}

func GCDSubtraction(a, b int) int {
	for a != b {
		if a > b {
			a -= b
		} else {
			b -= a
		}
	}

	return a
}

func GCDRecursive(a, b int) int {
	if b == 0 {
		return a
	} else {
		return gcd_recursive(b, a%b)
	}
}
