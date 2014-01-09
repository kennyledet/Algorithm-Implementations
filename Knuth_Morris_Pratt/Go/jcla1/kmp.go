package kmp

// KMPSearch has overall complexity O(k + n)
// where k is the length of the word
// and n is the length of the text to search in

func KMPSearch(txt, word string) int {
	m, i := 0, 0
	table := kmpTable(word)

	for (m + i) < len(txt) {
		if word[i] == txt[m+i] {
			if i == len(word)-1 {
				return m
			}

			i += 1
		} else {
			m += i - table[i]
			if table[i] > -1 {
				i = table[i]
			} else {
				i = 0
			}
		}
	}

	// We haven't found the word
	return len(txt)
}

func kmpTable(word string) []int {
	pos, cnd := 2, 0
	table := make([]int, len(word)+1)

	table[0], table[1] = -1, 0

	for pos < len(word) {
		if word[pos-1] == word[cnd] {
			cnd += 1
			table[pos] = cnd
			pos += 1
		} else if cnd > 0 {
			cnd = table[cnd]
		} else {
			table[pos] = 0
			pos += 1
		}
	}

	return table
}
