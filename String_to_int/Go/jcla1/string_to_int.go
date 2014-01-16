package stringToInt

import "math"

func StringToInt(str string) int {
	exp := len(str) - 1
	total := 0

	for i := 0; i < len(str); i++ {
		if str[i] >= '0' && str[i] <= '9' {
			total += int(str[i]-48) * int(math.Pow10(exp))
			exp -= 1
		}
	}

	return total
}
