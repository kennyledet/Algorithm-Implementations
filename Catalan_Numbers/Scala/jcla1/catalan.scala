object CatalanNumbers {
    def direct(n: Int): BigInt = fact(2*n) / (fact(n+1) * fact(n))

    private def fact(i: Int): BigInt = (2 to i).foldLeft(BigInt(1))(_ * _)
}