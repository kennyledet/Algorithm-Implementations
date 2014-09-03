using System;
using System.Collections.Generic;
using System.Diagnostics.Contracts;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JamLib.Algorithms.Sorting.OtherSorts
{
    public static class CountingSort
    {
        public static int[] Sort(IList<int> data)
        {
            int min = int.MaxValue;
            int max = int.MinValue;

            for (int i = 0; i < data.Count; i++)
            {
                int element = data[i];
                if (element < min) { min = element; }
                if (element > max) { max = element; }
            }

            return Sort(data, min, max);
        }


        /// <summary>
        /// The default implementation which creates a work array from 0 to max
        /// Only works with positive numbers
        /// </summary>
        public static int[] Sort(IList<int> data, int max)
        {
            Contract.Requires(data != null && Contract.ForAll(data, i => i >= 0));
            Contract.Requires(max >= 0 && max == data.Max());

            int[] count = new int[max + 1];
            int[] sorted = new int[data.Count];

            // Add the elements in order small --> big
            foreach (int key in data)
            {
                count[key] += 1;
            }

            // Transfer the temp array to the sorted array from small --> big
            int sortedIndex = 0;
            for (int number = 0; number < count.Length; number++)
            {
                // How often did we have this number in the input?
                for (int j = 0; j < count[number]; j++)
                {
                    sorted[sortedIndex++] = number;
                }
            }

            return sorted;
        }


        /// <summary>
        /// I feel like this way is a little bit more optimized since it saves space
        /// there is still the possibility of empty space beetwen min,max 
        /// but atleast it gets rid of the space from 0 to min
        /// 
        /// This will also work with negative numbers.
        /// </summary>
        public static int[] Sort(IList<int> data, int min, int max)
        {
            Contract.Ensures(data != null, "data cannot be a null pointer");
            Contract.Ensures(min == data.Min(), "wrong min submitted");
            Contract.Ensures(max == data.Max(), "wrong max submitted");

            int[] count = new int[(max - min) + 1];
            int[] sorted = new int[data.Count];

            // Add the elements in reverse order big --> small
            // NOTE: Could do key - min instead for order small --> big
            foreach (int key in data)
            {
                count[max - key] += 1;
            }

            // Transfer the temp array to the sorted array from small --> big
            int sortedIndex = data.Count - 1;
            for (int i = 0; i < count.Length; i++)
            {
                // How often did we have this number in the input?
                int number = max - i;
                for (int j = 0; j < count[i]; j++)
                {
                    sorted[sortedIndex--] = number;
                }
            }

            return sorted;
        }

    }
}
