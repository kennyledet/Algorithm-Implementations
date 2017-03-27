package roman_kachanovsky

import (
	"math"
	"errors"
)

type Edge [2]rune

type Graph struct{
	vertexes []rune
	edges []Edge
}

func BellmanFord(g Graph, w map[Edge]int, s rune) (map[rune]int, map[rune]rune, error) {
	d := make(map[rune]int)
	p := make(map[rune]rune)

	for _, v := range g.vertexes {
		d[v] = math.MaxInt64
		p[v] = '-'
	}

	d[s] = 0.0

	for i := 1; i < len(g.vertexes); i++ {
		for _, e := range g.edges {
			a, b := e[0], e[1]

			if d[a] + w[e] < d[b] {
				d[b] = d[a] + w[e]
				p[b] = a
			}
		}
	}

	for _, e := range g.edges {
		a, b := e[0], e[1]

		if d[a] + w[e] < d[b] {
			return nil, nil, errors.New("Graph contains negative cycles.")
		}
	}

	return d, p, nil
}
