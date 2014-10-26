using System;
using System.Collections.Generic;

namespace JamLib.Algorithms.Sorting
{
    public static class SortingUtils
    {
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
		
		public static void Swap<T>(IList<T> data, int i, int j)
        {
            T temp = data[i];
            data[i] = data[j];
            data[j] = temp;
        }
    }
}
