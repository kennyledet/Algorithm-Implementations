def ackermann(m: Int, n: Int): Int = (m, n) match {
    case (0, n) => n + 1
    case (m, 0) => ackermann(m - 1, 1)
    case _ => ackermann(m - 1, ackermann(m, n - 1))
}
