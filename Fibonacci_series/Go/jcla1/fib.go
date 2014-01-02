package fib

// This Fibonacci implementation uses a
// closure to generate successive Fibonacci terms.
// To get the terms you call "fib_closure()" and
// get back a function, which (at each call) returns
// the next Fibonacci term
func fib_closure() func() int {
	a, b := 0, 1
	return func() int {
		a, b = b, a+b
		return a
	}
}

// This is the recursive implementation, which
// expresses the Fibonacci series' simple recurrence
// relation:
//   fib(0) = 0
//   fib(1) = 1
//   fib(n) = fib(n-1) + fib(n-1)
func fib_rec(n int) int {
	if n < 2 {
		return n
	} else {
		return fib_rec(n-1) + fib_rec(n-2)
	}
}

// This is the iterative implementation of the
// Fibonacci series. It does not use recursion,
// which gets rid of the possibility of a stack-overflow.
func fib_loop(n int) int {
	a, b := 0, 1
	for ; n >= 0; n-- {
		a, b = b, a+b
	}

	return a
}
