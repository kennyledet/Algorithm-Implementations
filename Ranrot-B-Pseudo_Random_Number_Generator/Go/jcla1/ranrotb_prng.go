package ranrotb

// Call with seed and it will return a closure
// which will return pseudo-random numbers on
// consecutive calls
// Note: seed could be uint32(time.Now().Unix())
func rrbRand(seed uint32) func() uint32 {
	var lo, hi uint32

	// In Go ^ is the bitwise complement operator
	// In C this would be the tilde (~)
	lo, hi = seed, ^seed

	return func() uint32 {
		hi = (hi << 16) + (lo >> 16)
		hi += lo
		lo += hi
		return hi
	}
}
