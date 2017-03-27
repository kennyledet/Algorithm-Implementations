package roman_kachanovsky

import "math"

// These implementations are based on wasi0013's Python version

func ArithmeticMean(numbers []int) float64 {
	var sum int

	for _, v := range numbers {
		sum += v
	}

	return float64(sum) / float64(len(numbers))
}

func GeometricMean(numbers []int) float64 {
	var product float64 = 1.0

	for _, n := range numbers {
		product *= float64(n)
	}

	return math.Pow(product, 1.0 / float64(len(numbers)))
}

func HarmonicMean(numbers []int) float64 {
	var sum float64

	for _, n := range numbers {
		sum += 1.0 / float64(n)
	}

	return float64(len(numbers)) / sum
}

func QuadraticMean(numbers []int) float64 {
	var sum float64

	for _, n := range numbers {
		sum += float64(n * n)
	}

	return math.Pow(1.0 / float64(len(numbers)) * sum, 0.5)
}

func GeneralizedMean(numbers []int, power float64) float64 {
	var sum float64

	for _, n := range numbers {
		sum += math.Pow(float64(n), power)
	}

	return math.Pow(1.0 / float64(len(numbers)) * sum, 1.0 / power)
}

func WeightedMean(numbers []int, weights []float64) float64 {
	var sum, sum_of_weights float64

	for i, n := range numbers {
		sum += float64(n) * weights[i]
		sum_of_weights += weights[i]
	}

	return sum / sum_of_weights
}

func MidrangeMean(numbers []int) float64 {
	min := numbers[0]
	max := numbers[0]

	for _, n := range numbers {
		if n < min {
			min = n
		}

		if n > max {
			max = n
		}
	}

	return 0.5 * (float64(min + max))
}

func EnergaticMean(numbers []int) float64 {
	var sum float64

	for _, n := range numbers {
		sum += math.Pow(10.0, float64(n) / 10.0)
	}

	return 10 * math.Log10(1.0 / float64(len(numbers)) * sum)
}
