package caesarCipher

import (
	"strings"
	"unicode"
)

func Encode(input string, shift int) string {
	return convert(func(r rune) rune {
		return ((r - base + rune(shift)) % 26) + base
	}, input)
}

func Decode(input string, shift int) string {
	return convert(func(r rune) rune {
		return ((r - base - rune(shift)) % 26) + base
	}, input)
}

func convert(formula func(rune) rune, input string) string {
	return strings.Map(func(r rune) rune {
		if r < 65 || r > 122 {
			return r
		}

		var base rune = 65
		if unicode.IsLower(r) {
			// Not 26, becasue we need to account
			// for chars between uppers and lowers.
			base += 30
		}

		return formula(r)

	}, input)
}
