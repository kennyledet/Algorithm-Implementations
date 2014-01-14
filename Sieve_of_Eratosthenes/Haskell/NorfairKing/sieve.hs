primes :: [Integer]
primes = sieve [2..]
    where sieve (p:xs) = p : sieve [x|x <- xs, x `rem` p > 0]

firstPrimes n = take n primes

prime n = last $ firstPrimes n
