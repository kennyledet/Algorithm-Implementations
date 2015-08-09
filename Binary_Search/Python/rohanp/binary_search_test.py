import unittest
from binary_search import binary_search


class BinarySearchTest(unittest.TestCase):
    def test_empty(self):
        arr = []
        self.assertEquals(binary_search(arr, 1), -1)

    def test_single(self):
        arr = [1]
        self.assertEquals(binary_search(arr, 1), 0)

    def test_length_of_two(self):
        arr = [0, 1]
        self.assertEquals(binary_search(arr, 1), 1)
        self.assertEquals(binary_search(arr, 0), 0)

    def test_basic(self):
        arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        for i, n in enumerate(arr):
            self.assertEquals(binary_search(arr, n), i)

    def test_odd_len(self):
        arr = [2, 4, 6, 7, 9, 10, 14, 16, 19]
        for i, n in enumerate(arr):
            self.assertEquals(binary_search(arr, n), i)

    def test_missing(self):
        arr = [2, 4, 6, 7, 9, 10, 14, 16, 19]
        self.assertEquals(binary_search(arr, 5), -1)


if __name__ == '__main__':
    unittest.main()
