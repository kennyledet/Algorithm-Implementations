package roman_kachanovsky

import (
	"testing"
	"reflect"
)

func TestBellmanFord(t *testing.T) {
	cases := []struct {
		g Graph
		w map[Edge]int
		s rune
		distances map[rune]int
		paths map[rune]rune
	}{
		{
			Graph{
				[]rune{'A', 'B', 'C', 'D'},
				[]Edge{{'A', 'B'}, {'B', 'C'}, {'C', 'D'}, {'D', 'B'}},
			},
			map[Edge]int{
				Edge{'A', 'B'}: 1,
				Edge{'B', 'C'}: 3,
				Edge{'B', 'D'}: 1,
				Edge{'C', 'D'}: 8,
				Edge{'D', 'B'}: -2,
			},
			'A',
			map[rune]int{'A': 0, 'C': 4, 'B': 1, 'D': 12},
			map[rune]rune{'A': '-', 'C': 'B', 'B': 'A', 'D': 'C'},
		},
	}

	for _, c := range cases {
		got_distances, got_paths, err := BellmanFord(c.g, c.w, c.s)

		if err != nil {
			t.Errorf("BellmanFord(%q, %v, %q) -> Error: %s", c.g, c.w, c.s, err)
		} else {
			if !reflect.DeepEqual(got_distances, c.distances) || !reflect.DeepEqual(got_paths, c.paths) {
				t.Errorf("BellmanFord(%q, %v, %q) == %v, %q want %v, %q",
					c.g, c.w, c.s, got_distances, got_paths, c.distances, c.paths)
			}
		}
	}
}
