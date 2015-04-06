package harshad

import (
	"strconv"
	"strings"
)

func toInts(ss []string) []int {
	is := make([]int, len(ss))
	for i, v := range ss {
		var err error
		is[i], err = strconv.Atoi(v)
		if err != nil {
			panic(err)
		}
	}
	return is
}

func digits(n int) []int {
	return toInts(strings.Split(strconv.Itoa(n), ""))
}

func sum(is []int) (sum int) {
	for _, v := range is {
		sum += v
	}
	return
}

func IsHarshadNumber(n int) bool {
	return n%sum(digits(n)) == 0
}
