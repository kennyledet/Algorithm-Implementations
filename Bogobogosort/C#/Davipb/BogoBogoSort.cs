using System;
using System.Linq;

/* BogoBogoSort -- For when you want to take your time sorting something.
 * This particular implementation is based on David Morgan-Mar's idea,
 * which can be found here:
 * http://www.dangermouse.net/esoteric/bogobogosort.html
 */
namespace BogoBogoSort
{
	public static class BogoBogoSort
	{
		public static Random RNG = new Random();

		public static double[] Sort (double[] elements)
		{
			while (!IsSorted(elements))
				Shuffle(ref elements);

			return elements;
		}

		private static bool IsSorted (double[] elements)
		{
			// This will be recursively used, so we need an endpoint
			if (elements.Length <= 1)
				return true;

			/* This is where the magic of slowness happen.
			 *  1. Make a copy of the list of numbers.
			 *  2. Sort the first n-1 elements of the copy using bogobogosort.
			 *  3. Check to see if the nth element of the sorted copy is greater than the highest element of the first n-1 elements. 
			 *	   If so, the copy is now sorted, else randomise the order of the elements of the copy and go to step 2.
			 *  4. Check to see if the copy is in the same order as the original list.
			 */

			double[] copy = (double[])elements.Clone();
			double[] sorted;

			// Using "do" instead of just "while" guarantees the code will be ran at least once
			do
			{
				Shuffle(ref copy);
				sorted = Sort(copy.Take(copy.Length - 1).ToArray());
			}
			while (copy.Last() < sorted.Max());

			for (int i = 0; i < sorted.Length; i++)
				copy[i] = sorted[i];

			for (int i = 0; i < elements.Length; i++)
				if (copy[i] != elements[i])
					return false;

			return true;
		}

		public static void Shuffle(ref double[] array)
		{
			int n = array.Length;
			for (int i = 0; i < n; i++)
			{
				int r = i + (int)(RNG.NextDouble() * (n - i));
				double t = array[r];
				array[r] = array[i];
				array[i] = t;
			}
		}
	}
}
