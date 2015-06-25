#!/usr/bin/env python3
""" Factorial (Gamma Function Implementation) """

from math import sqrt, pi, e

def factorial(x):
    if 100 < x or type(x) != int:
        return gamma(x)
    else:
        return fact(x)

def fact(n):
    return 1 if n == 0 else n * fact(n-1)

def gamma(x):
    if x < 100:
        return gamma(x+1)/(x+1) #for more accuracy
    else:
        return sqrt(2*pi*x)*pow(x/e,x) #stirling's approximation

def main():
    print("5! = ", factorial(5))
    print("110! = ", factorial(110))
    print("1.6! = ", factorial(1.6))
    print("2.7! = ", factorial(2.7))
    print("4.824! = ", factorial(4.824))

if __name__ == "__main__": main()
