-- The nth fibonacci number.
f n = (last . fib) n

-- Take the n first fibonacci numbers.
-- This runs in O(n) time.
fib n = take n fibs

{-
    All fibonacci numbers.
    The list is made by prepending '1', twice,
    to the zipped sum of itself and itself, shifted one index.
    
    1, 1, 2, 3, 5, 8, 13 ...
          1, 1, 2, 3, 5  ...
          1, 2, 3, 5, 8  ...
-}
fibs = 1 : 1 : zipWith (+) fibs (tail fibs)
