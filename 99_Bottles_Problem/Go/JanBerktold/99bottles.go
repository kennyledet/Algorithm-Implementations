package main

import (
	"fmt"
)

func main() {
	pluralS := "s"
	for bottles := 99; bottles > 0; bottles-- {
		fmt.Printf("%v bottles of beer on the wall, %v bottle%v of beer.\n", bottles, bottles, pluralS)
		if bottles > 0 {
			fmt.Printf("Take one down and pass it around, %v bottle%v of beer on the wall.\n", bottles, pluralS)
		} else {
			fmt.Println("Take one down and pass it around, no more bottles of beer on the wall.")
		}
		if bottles == 2 {
			pluralS = ""
		}
	}
	fmt.Println("No more bottles of beer on the wall, no more bottles of beer.")
	fmt.Println("Go to the store and buy some more, 99 bottles of beer on the wall.")
}
