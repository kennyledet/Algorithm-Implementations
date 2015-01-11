using System.Collections.Generic;
using System.Linq;

namespace Happy
{
	public static class HappyNumbers
	{
		private static ulong[] Cycle = new[] { 4UL, 16UL, 37UL, 58UL, 89UL, 145UL, 42UL, 20UL };

		public static bool IsHappy(ulong numb)
		{
			if (Cycle.Contains(numb))
				return false;

			// Even though the values will always be 0~9, we use ulong for compability in later operations
			ulong[] digits = numb.ToString().ToCharArray().Select(x => ulong.Parse(x.ToString())).ToArray();

			ulong sum = digits.Aggregate(0UL, (acc, val) => acc + (val * val));

			if (sum == 1)
				return true;

			return IsHappy(sum);
		}

	}
}
