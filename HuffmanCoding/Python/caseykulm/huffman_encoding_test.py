#! /usr/bin/python

# "python huffman_encoding_test.py" to run on lorem_ipsum

import huffman_encoding

input_string = open("lorem_ipsum.txt", "r").read()
symbol_to_weight = huffman_encoding.count_symbols(input_string)
encoding = huffman_encoding.encode(symbol_to_weight)
huffman_encoding.print_encoding(encoding, symbol_to_weight)