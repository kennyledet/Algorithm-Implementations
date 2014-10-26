def toEgyptian(r: Rational): List[Rational] = {
    def remains(r: Rational): (Int, List[Rational]) = {
        val x = r.numer
        val y = r.denom

        val denom = (new Rational(y, x)).toDouble.ceil.toInt

        (denom, toEgyptian(r - new Rational(1, denom)))
    }

    r.numer match {
        case 0 => Nil
        case _ => {
            val (denom, remainders) = remains(r)
            new Rational(1, denom) :: remainders
        }
    }
}

def toVulgar(rs: List[Rational]): Rational = rs.foldLeft(Rational.zero)(_ + _)

class Rational(n: Int, d: Int = 1) {
    require(d != 0)

    private def gcd(a: Int, b: Int): Int =
        if (b == 0) a else gcd(b, a % b)

    private val g = gcd(n.abs, d.abs).abs
    val numer = (if (d < 0) -n.abs else n.abs) / g
    val denom = d.abs / g

    def ==(that: Rational): Boolean =
        numer == that.numer && denom == that.denom

    def +(that: Rational): Rational =
        new Rational(
            numer * that.denom + that.numer * denom,
            denom * that.denom
        )

    def -(that: Rational): Rational =
        new Rational(
            numer * that.denom - that.numer * denom,
            denom * that.denom
        )

    def * (that: Rational): Rational =
        new Rational(numer * that.numer, denom * that.denom)

    def / (that: Rational): Rational =
        new Rational(numer * that.denom, denom * that.numer)

    override def toString(): String = numer + "/" + denom

    def toDouble(): Double = Double.box(n) / Double.box(d)
}

object Rational {
    def zero = new Rational(0)
}