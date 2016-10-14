package main

import (
	"fmt"
)

func walk() []int32 {
	// doors are stored as 32 bit integers
	// so we actually store 32 * 4 = 128 doors, but we can ignore the extra ones
	doors := make([]int32, 4)

	for every := 1; every <= 100; every++ {
		for changeDoor := every; changeDoor <= 100; changeDoor += every {
			position := uint32(changeDoor % 32)
			doors[int(changeDoor/32)] ^= (1 << position)
		}
	}

	return doors
}

func printDoors(doors []int32) {
	for i := 0; i < 100; i++ {
		element := uint32(i / 32)
		position := uint32(i % 32)
		if (doors[element]>>position)&0x01 == 1 {
			fmt.Printf("%d\n", i)
		}
	}

}

func main() {
	doors := walk()
	printDoors(doors)
}
