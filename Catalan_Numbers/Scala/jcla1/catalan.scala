object CatalanNumbers {
    def direct(n: Int): BigInt =
        fact(2*n) / (fact(n+1) * fact(n))

    def binomial(n: Int): BigInt =
        if (n == 0) 1 else binom(2*n, n) - binom(2*n, n-1)

    def sum(n: Int): BigInt =
        (0 to n).map(i => binom(n, i).pow(2)).sum / (n + 1)

    private def binom(n: Int, k: Int): BigInt =
        fact(n) / (fact(n - k) * fact(k))

    private def fact(i: Int): BigInt =
        (2 to i).foldLeft(BigInt(1))(_ * _)
}
