using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JamLib.Algorithms.Sorting
{
    public static class SortingUtils
    {
        public static void Swap<T>(IList<T> data, int i, int j)
        {
            T temp = data[i];
            data[i] = data[j];
            data[j] = temp;
        }

        internal static bool Less<T>(T i, T j) { return Less(i, j, Comparer<T>.Default); }
        internal static bool Less<T>(T i, T j, IComparer<T> comparer) { return comparer.Compare(i, j) < 0; }

        // Fisher–Yates_shuffle: http://en.wikipedia.org/wiki/Fisher%E2%80%93Yates_shuffle
        public static void Shuffle<T>(this IList<T> array) { Shuffle(array, new Random()); }
        public static void Shuffle<T>(this IList<T> array, Random rng)
        {
            for (int i = array.Count; i > 1; i--)
            {
                // Pick random element to swap. 0 <= j <= i-1
                int j = rng.Next(i);
                Swap(array, i - 1, j);
            }
        }

        public static bool IsSorted<T>(IList<T> data) { return IsSorted(data, Comparer<T>.Default); }
        public static bool IsSorted<T>(IList<T> data, IComparer<T> comparer)
        {
            for (int i = 1; i < data.Count; i++)
            {
                // if the next element is smaller then the list is not sorted
                if (comparer.Compare(data[i - 1], data[i]) > 0) { return false; }
            }

            return true;
        }
    }
}
