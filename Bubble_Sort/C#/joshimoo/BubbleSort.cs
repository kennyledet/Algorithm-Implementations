using System.Collections.Generic;

namespace JamLib.Algorithms.Sorting.ExchangeSorts
{
    public static class BubbleSort
    {
        // TODO: Think about adding additional overloads for IComparable as well as Comparison (so that we can use lambda expressions)
        public static void Sort<T>(IList<T> data) { Sort(data, Comparer<T>.Default); }
        public static void Sort<T>(IList<T> data, IComparer<T> comparer)
        {
            int length = data.Count;
            bool sorted = false;
            while (!sorted)
            {
                // Reset Sort Status
                sorted = true;

                for (int i = 1; i < length; i++)
                {
                    // if this pair is out of order, swap them and remember something changed
                    if (comparer.Compare(data[i - 1], data[i]) > 0)
                    {
                        SortingUtils.Swap(data, i - 1, i);
                        sorted = false;
                    }
                }

                // NOTE: Optimization, since each pass trough the array the last element is always in it's final place. We no longer need to check it.
                length--;
            }
        }


    }
}