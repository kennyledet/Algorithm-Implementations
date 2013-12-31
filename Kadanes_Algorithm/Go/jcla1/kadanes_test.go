package kadane

import "testing"

func TestMaxSubarray(t *testing.T) {
	arrs := [][]int{[]int{-2, 1, -3, 4, -1, 2, 1, -5, 4}, []int{2, 3, 7, -5, -1, 4, -10}}
	expectedResults := []int{6, 12}

	var result int

	for i, expected := range expectedResults {
		result = MaxSubarray(arrs[i])
		if result != expected {
			t.Errorf("MaxSubarray(%v) = %d, want %d", arrs[i], result, expected)
		}
	}
}

func TestMax(t *testing.T) {
	a := []int{1, 5, 0, -1, 10}
	b := []int{1, 4, 0, 10, -1}
	expectedResults := []int{1, 5, 0, 10, 10}

	var result int

	for i, expected := range expectedResults {
		result = max(a[i], b[i])
		if result != expected {
			t.Errorf("max(%d, %d) = %d, want %d", a[i], b[i], result, expected)
		}
	}
}
