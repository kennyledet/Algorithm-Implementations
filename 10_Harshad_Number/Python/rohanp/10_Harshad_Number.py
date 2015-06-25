#!/usr/bin/env python3
""" Harshad Number Problem """
__author__ = "Rohan Pandit"

def is_harshad(n):
    return True if n % sum(map(int,list(str(n)))) == 0 else False

def main():
    for i in range(1,201):
        print(i,": ", is_harshad(i))

if __name__ == "__main__": main()
