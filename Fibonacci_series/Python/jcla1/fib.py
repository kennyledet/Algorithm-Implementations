# This is a recursive implementation of the fibonacci series.
# This is the most natural representaion of the series
# The recurrence relation is quite simple:
#   f(0) = 0
#   f(1) = 1
#   f(n) = f(n-1) + f(n-2)
# There is no point in trying to implement
# the fibonacci series in a tail-call recursive manner
# since the BDFL has stated multiple times that Python
# will not support tail-call optimisation (and it would
# just over complicate things)
def fib_rec(n):
    if n < 2:
        return n
    else:
        return fib_rec(n-1) + fib_rec(n-2)


# This implementation is a generator
# You call the function and get the generator back
# For getting values you can loop through the generator,
# just like with any other iterable
def fib():
    a, b = 0, 1
    while True:
        # This next line makes this function a generator
        # Each time the executor reaches this yield stmt
        # it halts execution and gives (yields) the values
        yield a
        # This makes use of Python's tuple
        # unpacking feature, which makes it
        # easy to swap variables (or in this
        # case update them simultaneously)
        # without another temporary variable
        a, b = b, a+b

# This function gives you the kth fibonacci
# term. It works just the same as the above
# implementation, with the exception that
# you only get one fibonacci value (the one-th
# you give as an argument)
def kth_fib(k):
    a, b = 0, 1
    while k != 0:
        a, b = b, a+b
        k -= 1
    return a
