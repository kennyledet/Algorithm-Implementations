using System;
using System.Collections.Generic;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using JamLib.Algorithms.Searching;

namespace JamLib.Algorithms.Searching.Tests
{
    [TestClass()]
    public class BinarySearchTests
    {
        [TestMethod()]
        public void SearchTest()
        {
            // Default Data needs to be sorted ascending
            var data = new int[] { -1, 0, 1, 4, 5, 7, 88, 90, 111, 160, 250 };
            int actualIndex = BinarySearch.Search(data, 90);
            int expectedIndex = 7;

            Assert.AreEqual(expectedIndex, actualIndex, "Binary search did not provide the correct index");
        }

        [TestMethod()]
        public void Search_CustomComparer_Test()
        {
            // This data, is sorted descending, therefore we use a custom comparer
            int[] data = new int[] { 12, 10, 7, 6, 5, 5, 4, 2, 1, 0, -4, -24 };
            Comparison<int> descending = ((x, y) => y > x ? 1 : y < x ? -1 : 0);
            int actualIndex = BinarySearch.Search(data, 4, Comparer<int>.Create(descending));
            int expectedIndex = 6;

            Assert.AreEqual(expectedIndex, actualIndex, "Binary search did not provide the correct index with a custom comparer");
        }
    }
}
