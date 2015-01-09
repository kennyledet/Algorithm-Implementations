using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CCipher
{
	public static class CaeserCipher
	{
		// We use lists to be able to wrap around the alphabet
		static List<char> Alphabet = Enumerable.Range('a', 'z' - 'a' + 1).Select(x => (char)x).ToList();
		static List<char> Numbers = Enumerable.Range(0, 10).Select(x => x.ToString()[0]).ToList();

		/// <summary>
		/// Encrypts a text with Ceaser's Cipher
		/// </summary>
		/// <param name="text">The text to encrypt</param>
		/// <returns>The encrypted text</returns>
		public static string Encrypt(string text)
		{
			return Shift(text, -3);
		}

		/// <summary>
		/// Decrypts a text using Ceaser's Cipher
		/// </summary>
		/// <param name="text">The text to decrypt</param>
		/// <returns>The decrypted text</returns>
		public static string Decrypt(string text)
		{
			return Shift(text, 3);
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
				else if (Numbers.Contains(c))
				{
					// Adds shift to the index and wraps it around it necessary
					int index = Numbers.FindIndex(x => x == c) + shift;
					if (index < 0)
						index += Numbers.Count;
					else if (index >= Numbers.Count)
						index -= Numbers.Count;

					result.Append(Numbers[index]);
				}
				else
					result.Append(c);
			}

			return result.ToString();
		}
	}
}
