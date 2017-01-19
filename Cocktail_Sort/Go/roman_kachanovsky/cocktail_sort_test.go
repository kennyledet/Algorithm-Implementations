package roman_kachanovsky

import (
	"testing"
	"reflect"
)

func TestCocktailSort(t *testing.T) {
	cases := []struct{
		in []int
		want []int
	}{
		{[]int{11, 33, 15, 190, 4, 23}, []int{4, 11, 15, 23, 33, 190}},
		{[]int{0, -2, 15, 89, 4, 23}, []int{-2, 0, 4, 15, 23, 89}},
		{[]int{12, 11, 11, 11, 11, 11}, []int{11, 11, 11, 11, 11, 12}},
	}

	for _, c := range cases {
		got := CocktailSort(c.in)

		if !reflect.DeepEqual(got, c.want) {
			t.Errorf("CoctailSort(%v) == %v want %v", c.in, got, c.want)
		}
	}
}
