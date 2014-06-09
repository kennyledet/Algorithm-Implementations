function catalan_direct(n) {
    return fact(2 * n) / (fact(n + 1) * fact(n))
}

function catalan_binomial(n) {
    if (n == 0) return 1;
    return binomial_coeff(2 * n, n) - binomial_coeff(2 * n, n - 1)
}

function catalan_sum(n) {
    return sum(range(0, n + 1).map(function(e) {
        return Math.pow(binomial_coeff(n, e), 2)
    })) / (n + 1);
}

function range(start, end) {
    return Array.apply(null, Array(end-start)).map(function (_, i) {return start+i;});
}

function sum(arr) {
    return arr.reduce(function(acc, e) { return acc + e; })
}

function binomial_coeff(n, k) {
    return fact(n) / (fact(n - k) * fact(k))
}

function fact (n) {
    if (n <= 1) return 1;
    return fact(n - 1) * n;
}