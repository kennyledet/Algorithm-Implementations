import scala.annotation.tailrec

def factorial(n: Int): BigInt = (BigInt(1) to BigInt(n)).product

def factorialTailRec(n: Int): BigInt = {
    @tailrec def fact(n: Int, acc: BigInt): BigInt = n match {
        case 0 | 1 => acc
        case n => fact(n - 1, acc * n)
    }
    fact(n, 1)
}