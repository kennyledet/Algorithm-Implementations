package levenshtein

import "testing"

var testCases = [][2]string{
	[2]string{"soylent green is people", "people soiled our green"},
	[2]string{"horse", "ros"},
	[2]string{"hello world", "how are you"},
}

var expectedResults = []int{
	19,
	3,
	10,
}

func runTest(f func(string, string) int, t *testing.T, name string) {
	for i, v := range testCases {
		if f(v[0], v[1]) != expectedResults[i] {
			t.Errorf("%s failed on: (%d != %d) %s -> %s", name, f(v[0], v[1]), expectedResults[i], v[0], v[1])
		}
	}
}

func TestRecursive(t *testing.T)     { runTest(RecursiveLevenshtein, t, "Recursive") }
func TestWagnerFisher(t *testing.T)  { runTest(WagnerFisherLevenshtein, t, "WagnerFisher") }
func TestReducedMatrix(t *testing.T) { runTest(ReducedMatrixLevenshtein, t, "ReducedMatrix") }
