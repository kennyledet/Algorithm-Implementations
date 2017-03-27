package roman_kachanovsky

import "testing"

func TestArithmeticMean(t *testing.T) {
	cases := []struct {
		in []int
		want float64
	}{
		{[]int{1, 2, 3, 4, 5}, 3.0},
		{[]int{1, 2, 3, 4}, 2.5},
		{[]int{5, 5, 5, 5, 5, 5, 5}, 5.0},
	}

	for _, c := range cases {
		got := ArithmeticMean(c.in)
		if got != c.want {
			t.Errorf("ArithmeticMean(%v) == %v, want %v", c.in, got, c.want)
		}
	}
}

func TestGeometricMean(t *testing.T) {
	cases := []struct {
		in []int
		want float64
	}{
		{[]int{1, 2, 3, 4, 5}, 2.605171084697352},
		{[]int{1, 2, 3, 4}, 2.2133638394006434},
		{[]int{5, 5, 5, 5, 5, 5, 5}, 5.0},
	}

	for _, c := range cases {
		got := GeometricMean(c.in)
		if got != c.want {
			t.Errorf("GeometricMean(%v) == %v, want %v", c.in, got, c.want)
		}
	}
}


func TestHarmonicMean(t *testing.T) {
	cases := []struct {
		in []int
		want float64
	}{
		{[]int{1, 2, 3, 4, 5}, 2.18978102189781},
		{[]int{1, 2, 3, 4}, 1.9200000000000004},
		{[]int{5, 5, 5, 5, 5, 5, 5}, 5.0},
	}

	for _, c := range cases {
		got := HarmonicMean(c.in)
		if got != c.want {
			t.Errorf("HarmonicMean(%v) == %v, want %v", c.in, got, c.want)
		}
	}
}

func TestQuadraticMean(t *testing.T) {
	cases := []struct {
		in []int
		want float64
	}{
		{[]int{1, 2, 3, 4, 5}, 3.3166247903554},
		{[]int{1, 2, 3, 4}, 2.7386127875258306},
		{[]int{5, 5, 5, 5, 5, 5, 5}, 5.0},
	}

	for _, c := range cases {
		got := QuadraticMean(c.in)
		if got != c.want {
			t.Errorf("QuadraticMean(%v) == %v, want %v", c.in, got, c.want)
		}
	}
}

func TestGeneralizedMean(t *testing.T) {
	cases := []struct {
		in []int
		power float64
		want float64
	}{
		{[]int{1, 2, 3, 4, 5}, 1.0, 3.0},
		{[]int{1, 2, 3, 4}, 1.0, 2.5},
		{[]int{5, 5, 5, 5, 5, 5, 5}, 1.0, 5.0},
		{[]int{1, 2, 3, 4, 5}, 1.5, 3.1688613641003776},
		{[]int{1, 2, 3, 4, 5}, 2.0, 3.3166247903554},
		{[]int{1, 2, 3, 4, 5}, 0.5, 2.8105398233187415},
	}

	for _, c := range cases {
		got := GeneralizedMean(c.in, c.power)
		if got != c.want {
			t.Errorf("GeneralizedMean(%v, %v) == %v, want %v", c.in, c.power, got, c.want)
		}
	}
}

func TestWeightedMean(t *testing.T) {
	cases := []struct {
		in []int
		weights []float64
		want float64
	}{
		{[]int{1, 2, 3, 4, 5}, []float64{0.1, 0.2, 0.2, 0.3, 0.2}, 3.3},
		{[]int{1, 2, 3, 4, 5}, []float64{0.5, 0.2, 0.1, 0.3, 0.2}, 2.615384615384616},
		{[]int{1, 2, 3, 4}, []float64{0.1, 0.2, 0.2, 0.3}, 2.8749999999999996},
		{[]int{5, 5, 5, 5, 5, 5, 5}, []float64{0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1}, 5.0},
	}

	for _, c := range cases {
		got := WeightedMean(c.in, c.weights)
		if got != c.want {
			t.Errorf("WeightedMean(%v, %v) == %v, want %v", c.in, c.weights, got, c.want)
		}
	}
}

func TestMidrangeMean(t *testing.T) {
	cases := []struct {
		in []int
		want float64
	}{
		{[]int{1, 2, 3, 4, 5}, 3.0},
		{[]int{1, 2, 3, 4}, 2.5},
		{[]int{5, 5, 5, 5, 5, 5, 5}, 5.0},
	}

	for _, c := range cases {
		got := MidrangeMean(c.in)
		if got != c.want {
			t.Errorf("MidrangeMean(%v) == %v, want %v", c.in, got, c.want)
		}
	}
}

func TestEnergaticMean(t *testing.T) {
	cases := []struct {
		in []int
		want float64
	}{
		{[]int{1, 2, 3, 4, 5}, 3.2276678141732704},
		{[]int{1, 2, 3, 4}, 2.6428450251024453},
		{[]int{5, 5, 5, 5, 5, 5, 5}, 4.999999999999999},
	}

	for _, c := range cases {
		got := EnergaticMean(c.in)
		if got != c.want {
			t.Errorf("EnergaticMean(%v) == %v, want %v", c.in, got, c.want)
		}
	}
}