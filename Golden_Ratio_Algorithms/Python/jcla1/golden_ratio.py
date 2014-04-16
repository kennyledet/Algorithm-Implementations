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