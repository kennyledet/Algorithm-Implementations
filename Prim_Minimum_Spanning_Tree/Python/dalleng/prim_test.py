import unittest
from prim import prim


class PrimTest(unittest.TestCase):
    def test_large_graph(self):
        nodes = range(1, 10)
        edges = [
            (1, 2, 4),
            (2, 1, 4),
            (1, 8, 8),
            (8, 1, 8),
            (2, 8, 11),
            (8, 2, 11),
            (2, 3, 8),
            (3, 2, 8),
            (3, 9, 2),
            (9, 3, 2),
            (3, 6, 4),
            (6, 3, 4),
            (3, 4, 7),
            (4, 3, 7),
            (4, 5, 9),
            (5, 4, 9),
            (4, 6, 14),
            (6, 4, 14),
            (5, 6, 10),
            (6, 5, 10),
            (6, 7, 2),
            (7, 6, 2),
            (7, 8, 1),
            (8, 7, 1),
            (7, 9, 6),
            (9, 7, 6),
            (8, 9, 7),
            (9, 8, 7)
        ]

        graph = (nodes, edges)
        mst = prim(graph, 1)
        cost = sum(weigth for _, __, weigth in mst)
        self.assertEquals(cost, 37)


if __name__ == '__main__':
    unittest.main()
