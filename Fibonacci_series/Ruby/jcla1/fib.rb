# Fibonacci recurrence relation:
#   fib(0) = 0
#   fib(1) = 1
#   fib(n) = fib(n-1) + fib(n-2)

# This is the recursive version of the Fibonacci series
# It does not use tail-call optimisation, since that
# would complicate the basic algorithm
def fib(n)
    if n < 2
        return n
    else
        return fib(n-1) + fib(n-2)
    end
end

# This is the tail-call optimizabel version
# of the fibonacci series.
#
# Note: Tail-call optimization is not
# supported in all Ruby implementations.
def fib_tco(n, a=0, b=1)
    if n == 0
        a
    else
        fib_tco(n-1, b, a+b)
    end
end

# This implemenation does not rely on recursion,
# which makes it optimal for large values of n,
# since you can't cause a stack overflow.
# The only limit you have is the maximum int value you can have.
def fib_loop(n)
    a, b = 0, 1

    while n != 0
        a, b = b, a+b
        n -= 1
    end
    # No return neccessary, since Ruby
    # returns the last evaluated expression
    a
end
