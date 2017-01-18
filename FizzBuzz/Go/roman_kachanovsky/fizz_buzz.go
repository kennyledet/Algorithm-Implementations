package roman_kachanovsky

import "strconv"

func FizzBuzz(n int) string {
	if (n % 3) == 0 && (n % 5) == 0 {
		return "Fizz Buzz"
	} else if (n % 3) == 0 {
		return "Fizz"
	} else if (n % 5) == 0 {
		return "Buzz"
	} else {
		return strconv.Itoa(n)
	}
}
