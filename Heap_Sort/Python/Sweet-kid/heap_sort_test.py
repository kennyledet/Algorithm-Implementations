import unittest
import heap_sort

class TestSequenceFunctions(unittest.TestCase):

    def setUp(self):
        self.values = [[ 16, 4, 10, 14, 7, 9, 3, 2, 8, 1 ]]
        self.expected = [[ 16, 14, 10, 8, 7, 9, 3, 2, 4, 1 ]]

    def runTest(self) :
        heap_sort.max_heapify( self.values[ 0 ], 1, len( self.values[ 0 ] ))
        self.assertEqual( self.values[ 0 ],
                          self.expected[ 0 ],
                          "not passed")

if __name__ == '__main__':
    unittest.main()
