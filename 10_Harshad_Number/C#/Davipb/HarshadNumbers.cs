using System;
using System.Collections.Generic;

namespace HarshadNumbers
{
	public static class HarshadNumbers
	{

		/// <summary>
		/// Checks weather or not a number is a 10-Harshad Number
		/// </summary>
		/// <param name="l">The number to be tested</param>
		/// <returns>True if l is a Harshad Number</returns>
		public static bool IsHarshad(ulong l)
		{
			// We don't want division by zero, so let's make sure the universe doesn't explode
			if (l == 0)
				return false;

			ulong sum = 0;

			// Loop through each digit, adding them to the total sum
			foreach (char c in l.ToString())
				sum += ulong.Parse(c.ToString());

			// If the remainder of the division is zero, the number is divisble.
			return (l % sum == 0);
		}

		// Something extra, the method below is not essential

		/// <summary>
		/// Generator method that generates all (computable) Harshad Numbers
		/// </summary>
		/// <returns>Harshad numbers, in crescent order, starting at 1</returns>
		public static IEnumerable<ulong> AllHarshadNumbers()
		{
			for (ulong l = 0; ; l++)
				if (IsHarshad(l))
					yield return l;
		}
	}
}
