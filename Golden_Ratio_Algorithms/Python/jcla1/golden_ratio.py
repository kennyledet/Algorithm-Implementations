from math import sqrt

def golden_ratio_root_iteration(phi=1.0, acc=1E-8):
    tmp = 0.0
    while abs(phi - tmp) > acc:
        tmp = phi
        phi = sqrt(1 + phi)
    return phi

def golden_ratio_fractional_iteration(phi=1.0, acc=1E-8):
    tmp = 0.0
    while abs(phi - tmp) > acc:
        tmp = phi
        phi = 1 + (1 / phi)
    return phi

def golden_ratio_babylonian_iteration(phi=1.0, acc=1E-8):
    tmp = 0
    while abs(phi - tmp) > acc:
        tmp = phi
        phi = (phi * phi + 1) / (2 * phi - 1)
    return phi

def golden_ration_fibonacci_iteration(seed=2, acc=1E-8):
    denum = fibonacci(seed)
    num = fibonacci(seed + 1)

    phi = num / denum
    tmp = 0.0
    while abs(phi - tmp) > acc:
        tmp = phi
        seed += 1
        denum = num
        num = fibonacci(seed)
        phi = num / denum
    return phi


def fibonacci(n):
    if n <= 2: return 1.0
    return fibonacci(n - 1) + fibonacci(n - 2)