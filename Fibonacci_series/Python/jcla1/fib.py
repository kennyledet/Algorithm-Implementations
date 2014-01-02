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
