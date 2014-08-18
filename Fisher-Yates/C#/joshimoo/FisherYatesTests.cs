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
            int[] notExpected = new int[] { -1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };
            SortingUtils.Shuffle(actual);

            CollectionAssert.AreNotEqual(notExpected, actual);
        }

        [TestMethod()]
        public void Shuffle_ExtensionMethod_Test()
        {
            int[] actual = new int[] { -1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };
            int[] notExpected = new int[] { -1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };
            actual.Shuffle();

            CollectionAssert.AreNotEqual(notExpected, actual);
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
