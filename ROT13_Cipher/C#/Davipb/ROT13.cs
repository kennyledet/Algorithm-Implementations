using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ROT
{
	public static class ROT13
	{
		// We use lists to be able to wrap around the alphabet
		static List<char> Alphabet = Enumerable.Range('a', 'z' - 'a' + 1).Select(x => (char)x).ToList();

		/// <summary>
		/// Applies ROT13 to a string
		/// </summary>
		/// <param name="text">The text to apply ROT13 to</param>
		/// <returns>Text with ROT13 applied</returns>
		public static string Transform(string text)
		{
			return Shift(text, 13);
		}

		/// <summary>
		/// Shifts a text by a certain number of characters around the alphabet
		/// </summary>
		/// <param name="text">The text to shift</param>
		/// <param name="shift">The number of characters to shift to text</param>
		/// <returns>The shifted text</returns>
		private static string Shift(string text, int shift)
		{
			StringBuilder result = new StringBuilder();

			foreach (char c in text)
			{
				if (Alphabet.Contains(char.ToLower(c)))
				{
					// Adds shift to the index and wraps it around it necessary
					int index = Alphabet.FindIndex(x => x == char.ToLower(c)) + shift;
					if (index < 0)
						index += Alphabet.Count;
					else if (index >= Alphabet.Count)
						index -= Alphabet.Count;

					// Maintains capitalization
					if (char.IsUpper(c))
						result.Append(char.ToUpper(Alphabet[index]));
					else
						result.Append(Alphabet[index]);
				}
				else
					result.Append(c);
			}

			return result.ToString();
		}
	}
}
