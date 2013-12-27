# Euclid's algorithm worst case runtime is O(h),
# where h is the number of digits in the smaller number
# See: http://en.wikipedia.org/wiki/Euclidean_algorithm#Worst-case_number_of_steps

def gcd_division(a, b):
    while b != 0:
        tmp = b
        b = a % b
        a = tmp
    return a

def gcd_subtraction(a, b):
    while a != b:
        if a > b
            a -= b
        else:
            b -= a
    return a

def gcd_recursive(a, b):
    if b == 0:
        return a
    else:
        return(b, a % b)