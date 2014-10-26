using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace JamLib.DataStructures.Trees.Tests
{
    [TestClass()]
    public class BinarySearchTreeTests
    {
        [TestMethod()]
        public void AddTest()
        {
            var bst = new BinarySearchTree<int>() { 10, 15, 5, 4, 7, 20, 14, 0, -5, -8, -2, -1 };
            bst.Add(55);
            bst.Add(-55);
            bst.Add(35);

            // TODO: Dump as array then compare against expected array
            Assert.IsTrue(bst.Contains(55), "Did not add element correctly");
            Assert.IsTrue(bst.Contains(-55), "Did not add element correctly");
            Assert.IsTrue(bst.Contains(35), "Did not add element correctly");
        }

        [TestMethod()]
        public void RemoveTest()
        {
            var bst = new BinarySearchTree<int>() { 10, 15, 5, 4, 7, 20, 14, 0, -5, -8, -2, -1 };
            bst.Remove(20);
            bst.Remove(0);
            bst.Remove(10);

            // TODO: Dump as array then compare against expected array
            Assert.IsFalse(bst.Contains(20), "Did not remove element correctly");
            Assert.IsFalse(bst.Contains(0), "Did not remove element correctly");
            Assert.IsFalse(bst.Contains(10), "Did not remove root element correctly");
        }

        [TestMethod()]
        public void ClearTest()
        {
            var bst = new BinarySearchTree<int>() { 10, 15, 5, 4, 7, 20, 14, 0, -5, -8, -2, -1 };
            bst.Clear();
            Assert.AreEqual(0, bst.Count, "Clearing the bst did not work");
        }

        [TestMethod()]
        public void ContainsTest()
        {
            var bst = new BinarySearchTree<int>() { 10, 15, 5, 4, 7, 20, 14, 0, -5, -8, -2, -1 };
            Assert.IsTrue(bst.Contains(0), "Contain method could not find element");
        }

        [TestMethod()]
        public void CopyToTest()
        {
            var bst = new BinarySearchTree<int>() { 90, 50, 150, 20, 75, 95, 175, 5, 25, 66, 80, 92, 111, 166, 200 };
            int[] expected = new int[] { 5, 20, 25, 50, 66, 75, 80, 90, 92, 95, 111, 150, 166, 175, 200 };
            int[] actual = new int[bst.Count];

            // Default is InOrder
            bst.CopyTo(actual, 0);

            CollectionAssert.AreEqual(expected, actual, "Inorder bst traversal did not sort correctly");
        }

        [TestMethod()]
        public void CopyTo_PreOrder_Test()
        {
            var bst = new BinarySearchTree<int>() { 90, 50, 150, 20, 75, 95, 175, 5, 25, 66, 80, 92, 111, 166, 200 };
            int[] expected = new int[] { 90, 50, 20, 5, 25, 75, 66, 80, 150, 95, 92, 111, 175, 166, 200 };
            int[] actual = new int[bst.Count];
            bst.CopyTo(actual, 0, TraversalMethod.Preorder);

            CollectionAssert.AreEqual(expected, actual, "Preorder bst traversal did not sort correctly");
        }

        [TestMethod()]
        public void CopyTo_InOrder_Test()
        {
            var bst = new BinarySearchTree<int>() { 90, 50, 150, 20, 75, 95, 175, 5, 25, 66, 80, 92, 111, 166, 200 };
            int[] expected = new int[] { 5, 20, 25, 50, 66, 75, 80, 90, 92, 95, 111, 150, 166, 175, 200 };
            int[] actual = new int[bst.Count];
            bst.CopyTo(actual, 0, TraversalMethod.Inorder);

            CollectionAssert.AreEqual(expected, actual, "Inorder bst traversal did not sort correctly");
        }

        [TestMethod()]
        public void CopyTo_PostOrder_Test()
        {
            var bst = new BinarySearchTree<int>() { 90, 50, 150, 20, 75, 95, 175, 5, 25, 66, 80, 92, 111, 166, 200 };
            int[] expected = new int[] { 5, 25, 20, 66, 80, 75, 50, 92, 111, 95, 166, 200, 175, 150, 90 };
            int[] actual = new int[bst.Count];
            bst.CopyTo(actual, 0, TraversalMethod.Postorder);

            CollectionAssert.AreEqual(expected, actual, "Postorder bst traversal did not sort correctly");
        }

        [TestMethod()]
        public void GetEnumeratorTest()
        {
            var bst = new BinarySearchTree<int>() { 90, 50, 150, 20, 75, 95, 175, 5, 25, 66, 80, 92, 111, 166, 200 };
            int[] expected = new int[] { 5, 20, 25, 50, 66, 75, 80, 90, 92, 95, 111, 150, 166, 175, 200 };
            var actual = new System.Collections.Generic.List<int>();

            // Iterate trough the collection, the default enumarator is InOrder
            foreach (var value in bst) { actual.Add(value); }

            CollectionAssert.AreEqual(expected, actual, "Inorder bst traversal did not work correctly");
        }


        [TestMethod()]
        public void GetEnumerator_PreOrder_Test()
        {
            var bst = new BinarySearchTree<int>() { 90, 50, 150, 20, 75, 95, 175, 5, 25, 66, 80, 92, 111, 166, 200 };
            int[] expected = new int[] { 90, 50, 20, 5, 25, 75, 66, 80, 150, 95, 92, 111, 175, 166, 200 };
            var actual = new System.Collections.Generic.List<int>();

            // Iterate trough the collection, the default enumarator is InOrder
            foreach (var value in bst.Preorder) { actual.Add(value); }

            CollectionAssert.AreEqual(expected, actual, "Preorder bst traversal did not work correctly");
        }

        [TestMethod()]
        public void GetEnumerator_InOrder_Test()
        {
            var bst = new BinarySearchTree<int>() { 90, 50, 150, 20, 75, 95, 175, 5, 25, 66, 80, 92, 111, 166, 200 };
            int[] expected = new int[] { 5, 20, 25, 50, 66, 75, 80, 90, 92, 95, 111, 150, 166, 175, 200 };
            var actual = new System.Collections.Generic.List<int>();

            // Iterate trough the collection, the default enumarator is InOrder
            foreach (var value in bst.Inorder) { actual.Add(value); }

            CollectionAssert.AreEqual(expected, actual, "Inorder bst traversal did not work correctly");
        }

        [TestMethod()]
        public void GetEnumerator_PostOrder_Test()
        {
            var bst = new BinarySearchTree<int>() { 90, 50, 150, 20, 75, 95, 175, 5, 25, 66, 80, 92, 111, 166, 200 };
            int[] expected = new int[] { 5, 25, 20, 66, 80, 75, 50, 92, 111, 95, 166, 200, 175, 150, 90 };
            var actual = new System.Collections.Generic.List<int>();

            // Iterate trough the collection, the default enumarator is InOrder
            foreach (var value in bst.Postorder) { actual.Add(value); }

            CollectionAssert.AreEqual(expected, actual, "Postorder bst traversal did not work correctly");
        }
    }
}
