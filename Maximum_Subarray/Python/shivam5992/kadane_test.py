import unittest
from kadane import kadane

class TestKadanesAlgorithm(unittest.TestCase):
    def setUp(self):
        self.arrays = [
            [-2, 1, -3, 4, -1, 2, 1, -5, 4],
            [2, 3, 7, -5, -1, 4, -10]
        ]
        self.expected_results = [6, 12]

    def test_kadanes_algorithm(self):
        for i, arr in enumerate(self.arrays):
            self.assertEqual(kadane(arr), self.expected_results[i])


if __name__ == '__main__':
    unittest.main()