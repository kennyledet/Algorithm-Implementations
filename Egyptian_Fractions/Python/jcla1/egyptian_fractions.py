from math import ceil
from fractions import Fraction

def egypt(frac):
    x = frac.numerator

    if x == 0:
        return []

    y = frac.denominator
    denom = int(ceil(Fraction(y, x)))

    f = Fraction(1, denom)

    remx = -y % x
    remy = y * denom

    remainders = egypt(Fraction(remx, remy))
    remainders.insert(0, f)

    return remainders

def vulgar(fracs):
    return sum(fracs)

if __name__ == '__main__':
    frac = Fraction(1023, 1024)
    a = egypt(frac)
    print a
    print vulgar(a)