package euclidean

func gcd_devision(a, b int) int {
	var tmp int

	for b != 0 {
		tmp = b
		b = a % b
		a = tmp
	}
}

func gcd_subtraction(a, b int) int {
	for a != b {
		if a > b {
			a -= b
		} else {
			b -= a
		}
	}

	return a
}

func gcd_recursive(a, b int) int {
	if b == 0 {
		return a
	} else {
		return gcd_recursive(b, a%b)
	}
}
