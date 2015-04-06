def fibonacci(n: Int): BigInt = n match {
    case 0 | 1 => n
    case n => fibonacci(n - 1) + fibonacci(n - 2)
}