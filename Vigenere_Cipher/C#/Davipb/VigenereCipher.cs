using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Diagnostics;

namespace Vigenere
{
	public static class VigenereCipher
	{
		// We use lists to be able to wrap around the alphabet
		static List<char> Alphabet = Enumerable.Range('a', 'z' - 'a' + 1).Select(x => (char)x).ToList();

		public static string Encrypt(string text, string key)
		{
			StringBuilder result = new StringBuilder();

			for (int i = 0; i < text.Length; i++)
				result.Append(Shift(text[i], key[i % key.Length], false));

			return result.ToString();
		}

		public static string Decrypt(string text, string key)
		{
			StringBuilder result = new StringBuilder();

			for (int i = 0; i < text.Length; i++)
				result.Append(Shift(text[i], key[i % key.Length], true));

			return result.ToString();
		}

		private static char Shift(char text, char key, bool revert)
		{

			if (Alphabet.Contains(char.ToLower(text)))
			{
				// Adds shift to the index and wraps it around it necessary
				int index = Alphabet.FindIndex(x => x == char.ToLower(text));

				if (revert)
					index -= Alphabet.FindIndex(x => x == char.ToLower(key));
				else
					index += Alphabet.FindIndex(x => x == char.ToLower(key));

				if (index > Alphabet.Count - 1)
					index -= Alphabet.Count;
				else if (index < 0)
					index += Alphabet.Count;

				// Maintains capitalization
				if (char.IsUpper(text))
					return char.ToUpper(Alphabet[index]);
				else
					return Alphabet[index];
			}
			else
				return text;
		}
	}
}
