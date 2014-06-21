package levenshtein

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
		m := minSingle(m, as[i])
	}

	return m
}

func max(a, b int) int {
	if a < b {
		return b
	}
	return a
}
