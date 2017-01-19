package roman_kachanovsky

func CocktailSort(a []int) []int {
	var swapped bool

	for {
		for i := 0; i < len(a) - 2; i++ {
			if a[i] > a[i + 1] {
				tmp := a[i]
				a[i] = a[i + 1]
				a[i + 1] = tmp
				swapped = true
			}
		}

		if !swapped {
			break
		}

		swapped = false

		for j := len(a) - 2; j > 0; j-- {
			if a[j] > a[j + 1] {
				tmp := a[j]
				a[j] = a[j + 1]
				a[j + 1] = tmp
				swapped = true
			}
		}

		if !swapped {
			break
		}
	}

	return a
}
