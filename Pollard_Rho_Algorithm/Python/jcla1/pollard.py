def pollard(n, f):
	x, y, d = 2, 2, 1
	while d == 1:
		x = f(x, n)
		y = f(f(x, n), n)
		d = gcd(abs(x - y), n)

	if d == n: return -1
	return d

def gcd(a, b):
	if (b == 0): return a
	return gcd(b, a % b)
