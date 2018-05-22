using System.Collections.Generic;
using System.Linq;

namespace Horspool
{
	public static class BoyerMooreHorspool
	{
		public static int Find(string haystack, string needle)
		{
			// If substring is bigger than string, no match exists
			if (needle.Length > haystack.Length)
				return -1;

			// If the substring has characters not in the string, no match exists
			if (needle.Except(haystack).Any())
				return -1;

			Dictionary<char, int> BadMatchTable = new Dictionary<char, int>();

			// Initializes every letter with the default value
			foreach (char c in haystack)
			{
				if (!BadMatchTable.Keys.Contains(c))
					BadMatchTable.Add(c, needle.Length);
			}

			// The formula for every letter in the needle (except the last) is lenght - index - 1
			for (int i = 0; i < needle.Length - 1; i++)
			{
					BadMatchTable[needle[i]] = needle.Length - i - 1;
			}

			int index = 0;

			while (index < haystack.Length - needle.Length)
			{
				bool match = true;

				for (int i = needle.Length - 1; i >= 0; i--)
				{
					if (needle[i] != haystack[index + i])
					{
						match = false;
						index += BadMatchTable[haystack[index + needle.Length - 1]];
						if (index >= haystack.Length)
                        {
                            break;
                        }
					}
				}

				if (match)
					return index;
			}

			return -1;
		}
	}
}
