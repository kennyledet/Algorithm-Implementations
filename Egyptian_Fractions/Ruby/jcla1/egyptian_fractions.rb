def egypt(frac)
    x = frac.numerator

    if x == 0
        return []
    end

    y = frac.denominator

    denom = Rational(y, x).ceil.to_i
    f = Rational(1, denom)

    remx = -y % x
    remy = y * denom

    remainders = egypt(Rational(remx, remy))
    remainders.unshift f
end

def vulgar(fracs)
    fracs.reduce(:+)
end