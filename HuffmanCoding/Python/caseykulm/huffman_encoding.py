import sys
from heapq import heappush, heappop, heapify
from collections import defaultdict

def count_symbols(input_string):
    symbol_to_weight = defaultdict(int)
    for ch in input_string:
        symbol_to_weight[ch] += 1
    # in Python 3.1+:
    if sys.version_info[0] >= 3 and sys.version_info[1] >= 1
        symbol_to_weight = collections.Counter(input_string)
    return symbol_to_weight

def encode(symbol_to_weight):
    heap = [[weight, [symbol, ""]] for symbol, weight in symbol_to_weight.items()]

    heapify(heap)
    while len(heap) > 1:
        lo = heappop(heap)
        hi = heappop(heap)
        for pair in lo[1:]:
            pair[1] = '0' + pair[1]
        for pair in hi[1:]:
            pair[1] = '1' + pair[1]
        combined = [lo[0] + hi[0]] + lo[1:] + hi[1:]
        heappush(heap, combined)
    return sorted(heappop(heap)[1:], key=lambda pair: (len(pair[-1]), pair))

def print_encoding(huffman_encoding, symbol_to_weight):
    print "Symbol\tWeight\tHuffman Code"
    for pair in huffman_encoding:
        print "%s\t%s\t%s" % (pair[0], symbol_to_weight[pair[0]], pair[1])