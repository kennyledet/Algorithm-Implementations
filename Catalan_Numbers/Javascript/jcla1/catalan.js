function catalan_direct(n) {
    return fact(2 * n) / (fact(n + 1) * fact(n))
}

function fact (n) {
    if (n <= 1) return 1;
    return fact(n - 1) * n;
}