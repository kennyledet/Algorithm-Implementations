-- This simply expresses the recurrence
-- relation of the fibonacci series. I
-- would not recommend using it in production
-- since it uses O(fib(n)) additions to calculate
-- the nth fibonacci term
fib 0 = 0
fib 1 = 1
fib n = fib (n-1) + fib (n-2)
