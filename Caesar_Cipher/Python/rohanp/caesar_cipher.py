#!/usr/bin/env python3
""" Caesar Shift """
__author__ = "Rohan Pandit"

import string

def caesar(plaintext, shift):
    l_shifted_alphabet = string.ascii_lowercase[shift:] + string.ascii_lowercase[:shift]
    u_shifted_alphabet = string.ascii_uppercase[shift:] + string.ascii_uppercase[:shift]
    lower = str.maketrans( string.ascii_lowercase, l_shifted_alphabet )
    upper = str.maketrans( string.ascii_uppercase, u_shifted_alphabet )
    return plaintext.translate( lower ).translate( upper )

def main():
    print( caesar("blah", 26) )
    print( caesar("BlAh", 26) )

if __name__ == "__main__": main()

