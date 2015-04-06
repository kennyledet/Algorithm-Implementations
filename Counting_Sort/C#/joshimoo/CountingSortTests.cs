using System.Linq;
using JamLib.Algorithms.Sorting.OtherSorts;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace JamLib.Algorithms.Sorting.OtherSorts.Tests
{
    [TestClass()]
    public class CountingSortTests
    {
        [TestMethod()]
        public void SortEmptyTest()
        {
            int[] data = new int[] { };
            int[] expected = new int[] { };
            var result = CountingSort.Sort(data);

            CollectionAssert.AreEqual(expected, result, "CountingSort did not sort correctly");
        }

        [TestMethod()]
        public void SortEmptyWrongMinMaxTest()
        {
            int[] data = new int[] { };
            int[] expected = new int[] { };

            // Trying the test with a wrong min/max count
            var result = CountingSort.Sort(data, 8, 10);

            CollectionAssert.AreEqual(expected, result, "CountingSort did not sort correctly");
        }

        [TestMethod()]
        public void SortEmptyWrongMaxTest()
        {
            int[] data = new int[] { };
            int[] expected = new int[] { };

            // Trying the test with a wrong max count
            var result = CountingSort.Sort(data, 20);

            CollectionAssert.AreEqual(expected, result, "CountingSort did not sort correctly");
        }

        [TestMethod()]
        public void SortNegativeMaxTest()
        {
            int[] data = new int[] { -11, -10, 0, 2, 2 };
            int[] expected = new int[] { -11, -10, 0, 2, 2 };

            // Trying the test with a Negative max count
            var result = CountingSort.Sort(data, 2);

            CollectionAssert.AreEqual(expected, result, "CountingSort did not sort correctly");
        }

        [TestMethod()]
        public void SortNegativeTest()
        {
            int[] data = new int[] { 0, 8, 8, -2, 5, 5, 5, 1, 2, 3, -1, -1, 4, 4, 4, 10 };
            int[] expected = new int[] { -2, -1, -1, 0, 1, 2, 3, 4, 4, 4, 5, 5, 5, 8, 8, 10 };
            var result = CountingSort.Sort(data);

            CollectionAssert.AreEqual(expected, result, "CountingSort did not sort correctly");
        }

        [TestMethod()]
        public void SortTest()
        {
            int[] data = new int[] { 8, 8, 5, 5, 5, 1, 2, 3, 4, 4, 4, 10 };
            int[] expected = new int[] { 1, 2, 3, 4, 4, 4, 5, 5, 5, 8, 8, 10 };
            var result = CountingSort.Sort(data);

            CollectionAssert.AreEqual(expected, result, "CountingSort did not sort correctly");
        }

        [TestMethod()]
        public void SortMinMaxTest()
        {
            int[] data = new int[] { 8, 8, 5, 5, 5, 1, 2, 3, 4, 4, 4, 10 };
            int[] expected = new int[] { 1, 2, 3, 4, 4, 4, 5, 5, 5, 8, 8, 10 };
            var result = CountingSort.Sort(data, data.Min(), data.Max());

            CollectionAssert.AreEqual(expected, result, "CountingSort did not sort correctly");
        }

        [TestMethod()]
        public void SortMaxTest()
        {
            int[] data = new int[] { 8, 8, 5, 5, 5, 1, 2, 3, 4, 4, 4, 10 };
            int[] expected = new int[] { 1, 2, 3, 4, 4, 4, 5, 5, 5, 8, 8, 10 };
            var result = CountingSort.Sort(data, data.Max());

            CollectionAssert.AreEqual(expected, result, "CountingSort did not sort correctly");
        }

    }
}
