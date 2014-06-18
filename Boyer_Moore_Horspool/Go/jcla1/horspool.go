package horspool

func Horspool(haystack, needle string) int {
	if len(needle) < 1 {
		return -1
	}

	badMatchTable := make(map[uint8]int, len(needle))
	maxOffset := len(haystack) - len(needle)
	lastIndex := len(needle) - 1
	offset := 0

	var scan int

	// Not using a range loop here, because it treat UTF-8 specially,
	// which is not necessary, since bytes and chars can be treated the same here
	for index := 0; index < len(needle); index++ {
		badMatchTable[needle[index]] = lastIndex - index
	}

	for offset <= maxOffset {
		for scan = lastIndex; needle[scan] == haystack[scan+offset]; scan-- {
			if scan == 0 {
				return offset
			}
		}

		v := badMatchTable[haystack[offset+lastIndex]]

		if v != 0 {
			offset += v
		} else {
			offset += lastIndex + 1
		}
	}

	return -1
}
