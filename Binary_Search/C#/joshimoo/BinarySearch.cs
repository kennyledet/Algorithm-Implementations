using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JamLib.Algorithms.Searching
{
    public static class BinarySearch
    {
        /// <summary>
        /// Finds an elements Index using worst O(lg n) in an already sorted data set
        /// </summary>
        /// <param name="data">the data needs to be sorted in ascending order, unless a custom comparer is provided</param>
        /// <returns>-1 if not found, else the index of the element</returns>
        public static int Search<T>(this IList<T> data, T element) { return Search(data, element, Comparer<T>.Default); }
        public static int Search<T>(this IList<T> data, T element, IComparer<T> comparer)
        {
            // NOTE: Exit early if the element couldn't possibly be in the data
            if (data.Count < 1 || comparer.Compare(data[0], element) > 0 || comparer.Compare(data[data.Count - 1], element) < 0) { return -1; }

            int minIndex = 0;
            int maxIndex = data.Count - 1;

            while (minIndex <= maxIndex)
            {
                int midIndex = (minIndex + maxIndex) / 2;
                int c = comparer.Compare(data[midIndex], element);

                if (c == 0) { return midIndex; } // Found
                else if (c > 0) { maxIndex = midIndex - 1; } // Left Side
                else if (c < 0) { minIndex = midIndex + 1; } // Right Side
            }

            // Did not find the Item
            return -1;
        }
    }
}
