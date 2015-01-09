using System.Collections.Generic;

namespace Fib
{
	public static class Fibonacci
	{
		/// <summary>
		/// Generator method that calculates the Fibonacci sequence
		/// </summary>
		/// <returns>The fibonacci sequence</returns>
		public static IEnumerable<ulong> Sequence()
		{
			ulong a = 1;
			ulong b = 1;

			yield return a;
			yield return b;

			while (true)
			{
				yield return a + b;

				ulong temp = a;
				a = b;
				b = temp;
				a += b;
			}
		}
	}
}
