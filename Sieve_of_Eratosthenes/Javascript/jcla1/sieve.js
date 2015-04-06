// Returns the number of primes in the range [0, n)
function sieve(n) {
	var arr = new Array(n),
		limit = ~~Math.sqrt(n),
		counter = 0;

	// Isn't there an easier way to do this!?
	for (var i = arr.length - 1; i >= 0; i--) {
		arr[i] = true;
	}

	for (var i = 2; i <= limit; i++) {
		if (arr[i]) {
			for (var j = i*i; j < n; j += i) {
				arr[j] = false;
			}
		}
	}

	return arr.reduce(function(acc, b) {
		return b ? acc + 1 : acc;
	}, -2);
}
