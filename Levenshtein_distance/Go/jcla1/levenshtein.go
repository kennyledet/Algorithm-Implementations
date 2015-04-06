package levenshtein

// Warning: Very slow!
func RecursiveLevenshtein(as, bs string) int {
	if min(len(as), len(bs)) == 0 {
		return len(as) | len(bs)
	}

	a, b := as[0], bs[0]
	cost := bool2Int(a == b)

	return min(1+RecursiveLevenshtein(as[1:], bs),
		1+RecursiveLevenshtein(as, bs[1:]),
		cost+RecursiveLevenshtein(as[1:], bs[1:]))
}

func WagnerFisherLevenshtein(as, bs string) int {
	m, n := len(as), len(bs)

	d := make([][]int, m+1)
	for i := range d {
		d[i] = make([]int, n+1)
	}

	for i := 0; i <= m; i++ {
		d[i][0] = i
	}

	for i := 0; i <= n; i++ {
		d[0][i] = i
	}

	for j := 1; j <= n; j++ {
		for i := 1; i <= m; i++ {
			if as[i-1] == bs[j-1] {
				d[i][j] = d[i-1][j-1]
			} else {
				d[i][j] = min(d[i-1][j]+1, d[i][j-1]+1, d[i-1][j-1]+1)
			}
		}
	}

	return d[m][n]
}

func ReducedMatrixLevenshtein(as, bs string) int {
	if min(len(as), len(bs)) == 0 {
		return len(as) | len(bs)
	} else if as == bs {
		return 0
	}

	v0 := make([]int, len(bs)+1)
	for i := range v0 {
		v0[i] = i
	}

	v1 := make([]int, len(bs)+1)

	for i := range as {
		v1[0] = i + 1

		for j := range bs {
			cost := bool2Int(as[i] == bs[j])
			v1[j+1] = min(v1[j]+1, v0[j+1]+1, v0[j]+cost)
		}

		for i := range v0 {
			v0[i] = v1[i]
		}
	}

	return v1[len(bs)]
}

func bool2Int(a bool) int {
	if a {
		return 0
	}
	return 1
}

func minSingle(a, b int) int {
	if a > b {
		return b
	}
	return a
}

func min(as ...int) int {
	if len(as) == 0 {
		return 0
	} else if len(as) == 1 {
		return as[0]
	}

	m := as[0]
	for i := 1; i < len(as); i++ {
		m = minSingle(m, as[i])
	}

	return m
}

func max(a, b int) int {
	if a < b {
		return b
	}
	return a
}
