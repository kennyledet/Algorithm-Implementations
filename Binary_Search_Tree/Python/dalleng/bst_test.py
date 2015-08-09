import unittest
from bst import BinarySearchTree

class BinarySearchTreeTest(unittest.TestCase):
    def test_insertion(self):
        tree = BinarySearchTree()
        tree.insert(8)
        tree.insert(3)
        tree.insert(10)
        tree.insert(1)
        tree.insert(6)
        tree.insert(4)
        tree.insert(7)
        tree.insert(14)
        tree.insert(13)
        self.assertEquals(tree.root.value, 8)
        self.assertEquals(tree.root.left.value, 3)
        self.assertEquals(tree.root.left.left.value, 1)
        self.assertEquals(tree.root.left.right.value, 6)
        self.assertEquals(tree.root.left.right.left.value, 4)
        self.assertEquals(tree.root.left.right.right.value, 7)
        self.assertEquals(tree.root.right.value, 10)
        self.assertEquals(tree.root.right.right.value, 14)
        self.assertEquals(tree.root.right.right.left.value, 13)

    def test_search(self):
        # Emptry Tree
        self.assertEquals(BinarySearchTree().search(8), None)

        tree = BinarySearchTree()
        tree.insert(8)
        tree.insert(3)
        tree.insert(10)
        tree.insert(1)
        tree.insert(6)
        tree.insert(4)
        tree.insert(7)
        tree.insert(14)
        tree.insert(13)
        self.assertEquals(tree.search(6).value, 6)
        self.assertEquals(tree.search(2), None)
        self.assertEquals(tree.search(15), None)
        self.assertEquals(tree.search(13).value, 13)
        self.assertEquals(tree.search(1).value, 1)

    def test_deletion(self):
        tree = BinarySearchTree()
        tree.insert(8)
        tree.insert(3)
        tree.insert(10)
        tree.insert(1)
        tree.insert(6)
        tree.insert(4)
        tree.insert(7)
        tree.insert(14)
        tree.insert(13)

        tree.delete(1)
        tree.delete(14)
        tree.delete(6)

        self.assertEquals(tree.root.value, 8)
        self.assertEquals(tree.root.left.value, 3)
        self.assertEquals(tree.root.left.left, None)
        self.assertEquals(tree.root.left.right.value, 7)
        self.assertEquals(tree.root.left.right.left.value, 4)
        self.assertEquals(tree.root.left.right.right, None)
        self.assertEquals(tree.root.right.value, 10)
        self.assertEquals(tree.root.right.right.value, 13)

        tree.delete(8)
        self.assertEquals(tree.root.value, 10)
        self.assertEquals(tree.root.right.value, 13)


if __name__ == '__main__':
    unittest.main()
