package stringToInt

import "testing"

func TestStringToInt(t *testing.T) {
	str := []string{"0", "1", "2", "100", "123", "123455426"}
	ints := []int{0, 1, 2, 100, 123, 123455426}

	var result int

	for i, v := range str {
		result = StringToInt(v)
		if result != ints[i] {
			t.Errorf("StringToInt(%s) = %d, wanted %d", v, result, ints[i])
		}
	}
}
