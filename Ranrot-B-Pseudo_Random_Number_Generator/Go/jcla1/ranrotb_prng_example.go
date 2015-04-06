package ranrotb

import (
	"fmt"
	"time"
)

func Example() {
	r := rrbRand(uint32(time.Now().Unix()))
	m := make(map[uint32]int, 10)
	for i := 0; i < 100000; i++ {
		n := r() % 10

		if _, ok := m[n]; !ok {
			m[n] = 1
		} else {
			m[n] += 1
		}
	}

	fmt.Println(m)
}
