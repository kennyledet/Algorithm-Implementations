package bogosort

import "testing"

func TestIsSorted(t *testing.T) {
	arrs := [][]int{[]int{1, 2, 3, 4}, []int{}, []int{4, 6, 1, 6, 8}}
	expectedResults := []bool{true, true, false}

	var result bool

	for i, expected := range expectedResults {
		result = isSorted(arrs[i])
		if result != expected {
			t.Errorf("isSorted(%v) = %t, want %t", arrs[i], result, expected)
		}
	}
}

func TestBogosort(t *testing.T) {
	arrs := [][]int{[]int{-2, 1, -3, 4, -1, 2, 1, -5, 4}, []int{2, 3, 7, -5, -1, 4, -10}}

	var result []int

	for _, arr := range arrs {
		result = Bogosort(arr)
		if !isSorted(result) {
			t.Errorf("Bogosort(%v) = %v", arr, result)
		}
	}
}
