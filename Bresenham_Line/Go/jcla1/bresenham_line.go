package bresenhamLine

import (
	"math"
)

type Point struct {
	x, y int
}

// Learn more here: http://en.wikipedia.org/wiki/Bresenham's_line_algorithm
// Calculates all Points on a line between the parameters a and b
func BresenhamLine(a, b Point) []Point {
	points := make([]Point, 0)

	deltaX := abs(b.x - a.x)
	deltaY := abs(b.y - a.y)

	var err float64 = 0
	deltaErr := math.Abs(float64(deltaY) / float64(deltaX))

	y := a.y

	for x, end := a.x, b.x; x < end; x++ {
		points = append(points, Point{x: x, y: y})
		err += deltaErr

		if err >= 0.5 {
			y += 1
			err -= 1
		}
	}

	points = append(points, Point{x: b.x, y: b.y})

	return points
}

// This is just a convinience function,
// since the is no abs func for integers
func abs(n int) int {
	return int(math.Abs(float64(n)))
}
