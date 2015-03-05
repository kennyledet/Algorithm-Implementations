package main

import (
	"fmt"
	"math"
)

type Field struct {
	value    int
	pregiven bool
	options  []int
}

type Sudoku [][]Field

func newField() Sudoku {
	result := make(Sudoku, 9)
	for i := 0; i < len(result); i++ {
		result[i] = make([]Field, 9)
	}
	return result
}

// Generates an array of the numbers from 0 to 9
// Helper method for createOptions
func makeNumbers() []int {
	numbers := make([]int, 9)
	for i := 0; i < len(numbers); i++ {
		numbers[i] = i + 1
	}
	return numbers
}

// Checks whether a sudoku is fully solved
func isDone(sd Sudoku) bool {
	for y := 0; y < len(sd); y++ {
		for x := 0; x < len(sd[y]); x++ {
			if sd[y][x].value == 0 {
				return false
			}
		}
	}
	return true
}

// Takes a field in a sudoku and creates a list of all legit numbers for this field
func createOptions(sd Sudoku, x, y int) []int {
	result := make([]int, 10, 10)
	numbers := makeNumbers()

	// horizontal line
	for nX := 0; nX < 9; nX++ {
		if sd[y][nX].value != 0 {
			numbers[sd[y][nX].value-1] = 0
		}
	}

	// vertical line
	for nY := 0; nY < 9; nY++ {
		if sd[nY][x].value != 0 {
			numbers[sd[nY][x].value-1] = 0
		}
	}

	// quadrant
	qX, qY := int(math.Floor(float64(x/3.0))), int(math.Floor(float64(y/3.0)))
	for nX := qX * 3; nX < (qX+1)*3; nX++ {
		for nY := qY * 3; nY < (qY+1)*3; nY++ {
			if sd[nY][nX].value != 0 {
				numbers[sd[nY][nX].value-1] = 0
			}
		}
	}

	counter := 0
	for _, num := range numbers {
		if num != 0 {
			result[counter] = num
			counter++
		}
	}

	return result[0:counter]
}

// Searches the field with the lowest number of possible values
func fieldWithLowest(sd Sudoku) (x, y int) {
	lowest := 100
	lX, lY := 0, 0
	for y := 0; y < len(sd); y++ {
		for x := 0; x < len(sd[y]); x++ {
			if sd[y][x].value == 0 {
				if len(sd[y][x].options) < lowest {
					lX, lY = x, y
					lowest = len(sd[y][x].options)
				}
			}
		}
	}
	return lX, lY
}

func copyField(sd Sudoku, y, x int) Field {
	return Field{
		sd[y][x].value,
		sd[y][x].pregiven,
		sd[y][x].options,
	}
}

func copySudoku(sd Sudoku) Sudoku {
	field := newField()
	for y := 0; y < len(sd); y++ {
		for x := 0; x < len(sd[y]); x++ {
			field[y][x] = copyField(sd, y, x)
		}
	}

	return field
}

func SolveSudoku(sd Sudoku) Sudoku {

	for {
		// First step: For every non-full field, create all options
		mod := false

		for y := 0; y < len(sd); y++ {
			for x := 0; x < len(sd[y]); x++ {
				if sd[y][x].value == 0 {
					options := createOptions(sd, x, y)
					if len(options) == 0 {
						return nil
					} else if len(options) == 1 {
						sd[y][x].value = options[0]
						mod = true
					} else {
						sd[y][x].options = options
					}

				}
			}
		}

		if !mod {
			break
		}
	}

	if isDone(sd) {
		return sd
	}

	// For every possible option for the field: Try it!
	lX, lY := fieldWithLowest(sd)
	for _, option := range sd[lY][lX].options {
		newField := copySudoku(sd)
		newField[lY][lX].value = option
		if solField := SolveSudoku(newField); solField != nil {
			return solField
		}
	}

	return nil
}

func printField(sd Sudoku) {
	for i := 0; i < len(sd); i++ {
		for f := 0; f < len(sd[i]); f++ {
			fmt.Print(sd[i][f].value, " ")
		}
		fmt.Print("\n")
	}
	fmt.Print("-------------------------------------------\n")
}

// Takes a string containing all numbers of the sudoku puzzle concatenated together
func SodukuFromString(str string) Sudoku {
	result := newField()
	for i := 0; i < 9*9; i++ {
		num := int(str[i] - '0')
		result[int(math.Floor(float64(i)/9.0))][i%9] = Field{
			num,
			num != 0,
			nil,
		}
	}

	return result
}

func main() {
	field := SodukuFromString("003020600900305001001806400008102900700000008006708200002609500800203009005010300")
	printField(SolveSudoku(field))
}
