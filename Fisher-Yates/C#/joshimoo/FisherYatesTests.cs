using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace JamLib.Algorithms.Sorting.Tests
{
    [TestClass()]
    public class SortingUtilsTests
    {
        [TestMethod()]
        public void ShuffleTest()
        {
            int[] actual = new int[] { -1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };
            int[] expected = new int[] { 8, 10, 5, 1, -1, 6, 9, 3, 0, 4, 2, 7 };
            SortingUtils.Shuffle(actual);

            // Two collections are equivalent if they have the same elements in the same quantity, but in any order.
            CollectionAssert.AreEquivalent(expected, actual, "The shuffle did not shuffle correctly");
        }

        [TestMethod()]
        public void Shuffle_SuppliedRNG_Test()
        {
            // using rng with a fixed seed so we can compare this shuffle against a previous shuffle with the same seed.
            var random = new Random(1024);
            int[] actual = new int[] { -1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };
            int[] expected = new int[] { 8, 10, 5, 1, -1, 6, 9, 3, 0, 4, 2, 7 };
            SortingUtils.Shuffle(actual, random);

            CollectionAssert.AreEqual(expected, actual, "The shuffle did not produce the expected result");
        }

        [TestMethod()]
        public void Shuffle_ExtensionMethod_Test()
        {
            int[] actual = new int[] { -1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };
            int[] expected = new int[] { -1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };
            actual.Shuffle();

            CollectionAssert.AreEquivalent(expected, actual);
        }

        [TestMethod()]
        public void Shuffle_Empty_Test()
        {
            int[] actual = new int[0];
            int[] expected = new int[0];
            SortingUtils.Shuffle(actual);

            CollectionAssert.AreEquivalent(expected, actual);
        }
    }
}
