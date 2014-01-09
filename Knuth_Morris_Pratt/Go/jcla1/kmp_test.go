package kmp

import "testing"

func TestKNPSearch(t *testing.T) {
	texts := []string{"ABC ABCDAB ABCDABCDABDE", "0011001011", "agoago go go golang gos"}
	words := []string{"ABCDABD", "0101", "go go go golang"}
	expected := []int{15, 5, 4}

	var result int

	for i, exp := range expected {
		result = KMPSearch(texts[i], words[i])
		if result != exp {
			t.Errorf("KNPSearch(texts[%d], words[%d]) = %d, wanted %d", i, i, result, exp)
		}
	}
}
