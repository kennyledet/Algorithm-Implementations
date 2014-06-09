function catalan_direct(n) {
    return fact(2 * n) / (fact(n + 1) * fact(n))
}

function catalan_binomial(n) {
    if (n == 0) return 1;
    return binomial_coeff(2 * n, n) - binomial_coeff(2 * n, n - 1)
}

function binomial_coeff(n, k) {
    return fact(n) / (fact(n - k) * fact(k))
}

function fact (n) {
    if (n <= 1) return 1;
    return fact(n - 1) * n;
}