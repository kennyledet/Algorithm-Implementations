package main

import (
	"testing"
)

func TestDoors(t *testing.T) {
	doors := walk()

	squarePointer := 0
	perfectSquares := []int{
		1, 4, 9, 16, 25, 36, 49, 64, 81,
	}

	for i := 0; i < 100; i++ {
		element := uint32(i / 32)
		position := uint32(i % 32)
		if (doors[element]>>position)&0x01 == 1 {
			if perfectSquares[squarePointer] != i {
				t.Fatalf("Door %v is open but should not be.", i)
			}
			squarePointer++
		} else {
			if len(perfectSquares) > squarePointer && perfectSquares[squarePointer] == i {
				t.Fatalf("Door %v should have been open.", i)
			}
		}
	}

	if squarePointer <= len(perfectSquares)-1 {
		t.Fatalf("Door %v should have been open, however it is not.", perfectSquares[squarePointer])
	}
}
