-- Euclids algorithm with remainders
euclid :: Integral a => a -> a -> a
euclid a 0 = a
euclid a b = euclid b (a `mod` b)

-- Euclids algorithm with substraction
euclid' :: Integral a => a -> a -> a
euclid' a 0 = a
euclid' a b | a > b = euclid' (a-b) b
euclid' a b | otherwise = euclid a (b-a)
