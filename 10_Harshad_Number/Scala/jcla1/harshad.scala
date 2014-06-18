def digits(n: Int): Array[Int] =
    n.toString.split("").drop(1).map(_.toInt)

def isHarshad(n: Int): Boolean =
    n % digits(n).sum == 0