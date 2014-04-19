package phi

import "math"

func RootIteration(phi, epsilon float64) float64 {
	tmp := 0.0

	for math.Abs(tmp-phi) > epsilon {
		tmp = phi
		phi = math.Sqrt(1 + phi)
	}

	return phi
}

func FractionalIteration(phi, epsilon float64) float64 {
	tmp := 0.0

	for math.Abs(tmp-phi) > epsilon {
		tmp = phi
		phi = 1 + (1 / phi)
	}

	return phi
}

func BabylonianIteration(phi, epsilon float64) float64 {
    tmp := 0.0

    for math.Abs(tmp-phi) > epsilon {
        tmp = phi
        phi = (phi * phi + 1) / (2 * phi - 1)
    }

    return phi
}

// Tip: Use seed = 2 to start with!
func FibonacciIteration(seed int, epsilon float64) float64 {
    denum := fibonacci(seed)
    num := fibonacci(seed + 1)

    phi := num / denum
    tmp := 0.0

    for math.Abs(tmp-phi) > epsilon {
        tmp = phi
        seed += 1
        denum = num
        num = fibonacci(seed)
        phi = num / denum
    }

    return phi
}

func fibonacci(n int) float64 {
    if n <= 2 { return 1 }
    return fibonacci(n - 1) + fibonacci(n - 2)
}
