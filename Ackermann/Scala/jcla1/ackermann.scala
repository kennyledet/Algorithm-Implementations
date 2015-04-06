def ackermann(m: Int, n: Int): Int = (m, n) match {
    case (0, n) => n + 1
    case (m, 0) => ackermann(m - 1, 1)
    case _ => ackermann(m - 1, ackermann(m, n - 1))
}

def origAckermann(m: Int, n: Int, p: Int): Int = (m, n, p) match {
    case (m, n, 0) => m + n
    case (m, 0, 1) => 0
    case (m, 0, 2) => 1
    case (m, 0, p) => m
    case (m, n, p) => origAckermann(m, origAckermann(m, n - 1, p), p - 1)
}
