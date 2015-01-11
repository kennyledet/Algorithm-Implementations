using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Crypto
{
	public static class Cryptography
	{
		/// <summary>
		/// Encrypts numbers with TSA's top secret encryption method
		/// </summary>
		/// <param name="numbers">The numbers to be encrypted</param>
		/// <returns>TSA's top secret encryption for the numbers</returns>
		public static long Encrypt(long[] numbers)
		{
			// We add +1 to the smallest number in the list, which will cause the biggest increase in product
			int index = 0;

			for (int i = 0; i < numbers.Length; i++)
			{
				if (numbers[i] == numbers.Min())
				{
					index = i;
					break;
				}
			}

			numbers[index]++;

			// Return the product of the numbers
			return numbers.Aggregate(1L, (acc, val) => acc * val);
		}
	}
}
