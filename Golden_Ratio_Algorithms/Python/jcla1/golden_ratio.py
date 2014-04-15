from math import sqrt

def golden_ratio_root_iteration(phi=1, acc=1E-8):
    tmp = 0
    while abs(phi - tmp) > acc:
        tmp = phi
        phi = sqrt(1 + phi)
    return phi