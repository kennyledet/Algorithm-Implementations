"""
Bloomfilters are a memory efficient way of checking if an element is part of a set or not

here is a pretty decent tutorial http://billmill.org/bloomfilter-tutorial/
"""

from bitarray import bitarray
import mmh3

class BloomFilter:

    def __init__(self):
        self.HASH_SIZE = 1000

        self.bits = bitarray(self.HASH_SIZE)
        self.bits.setall(0)

    def add(self, word):
        for seed in range(self.HASH_SIZE):
            bit_value = mmh3.hash(word, seed) % self.HASH_SIZE
            self.bits[bit_value] = 1

    def check(self, word):
        for seed in range(self.HASH_SIZE):
            bit_value = mmh3.hash(word, seed) % self.HASH_SIZE
            if self.bits[bit_value] == 0:
                return False 
        return True


