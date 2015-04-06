function defaultPollard(n) {
    return pollard(n, function(x) {
        return (x*x - 1) % n;
    });
}

// Takes f(x, n) where n is the integer to factorize
function pollard(n, f) {
    var x = 2,
        y = 2,
        d = 1;

    while (d == 1) {
        x = f(x, n);
        y = f(f(y, n), n);
        d = gcd(Math.abs(x - y), n);
    }

    if  (d == n) return -1;
    return d;
}

function gcd(a, b) {
    if (b == 0) return a;
    return gcd(b, a % b);
}