import Data.Ratio

-- Conversion between "vulgar" and egyptian fractions
-- Taken from: "Good Math" by Mark C. Chu-Carroll PragProg
egypt :: Rational -> [Rational]
egypt 0 = []
egypt fraction =
    (1%denom):(remainders) where
        x = numerator fraction
        y = denominator fraction
        denom = ceiling (y%x)
        remx = (-y) `mod` x
        remy = y*denom
        remainders = egypt (remx%remy)

vulgar :: [Rational] -> Rational
vulgar r = foldl (+) 0 r
