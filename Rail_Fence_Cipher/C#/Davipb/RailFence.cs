using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace RailFence
{
	public static class RailFenceCipher
	{
		/// <summary>
		/// Encrypts a text with Rail Fence Cypher using a certain amount of rails
		/// </summary>
		/// <param name="text">The text to encrypt</param>
		/// <param name="rails">The number of rails to use</param>
		/// <returns>The encrypted text</returns>
		public static string Encrypt(string text, int rails)
		{
			// Removes all non-alphanumerical characters on the text
			text = text.ToUpper();
			text = Regex.Replace(text, @"[^A-Z0-9]", string.Empty);

			var lines = new List<StringBuilder>();

			for (int i = 0; i < rails; i++)
				lines.Add(new StringBuilder());

			// Here we follow a zig-zag pattern around the lines by turning
			// direction into 1 or -1 if we hit a 'wall' (first or last line)

			int currentLine = 0;
			int direction = 1;

			for (int i = 0; i < text.Length; i++)
			{
				lines[currentLine].Append(text[i]);

				if (currentLine == 0)
					direction = 1;
				else if (currentLine == rails - 1)
					direction = -1;

				currentLine += direction;
			}

			// Now we just take all the lines all put them in the result

			StringBuilder result = new StringBuilder();

			for (int i = 0; i < rails; i++)
				result.Append(lines[i].ToString());

			return result.ToString();
		}

		/// <summary>
		/// Decrypts a text with Rail Fence Cypher using a certain amount of rails
		/// </summary>
		/// <param name="text">The text to be decrypted</param>
		/// <param name="rails">The number of rails used when encrypting</param>
		/// <returns>The decrypted text</returns>
		public static string Decrypt(string text, int rails)
		{
			// Removes all non-alphanumerical characters on the text
			text = text.ToUpper();
			text = Regex.Replace(text, @"[^A-Z0-9]", string.Empty);

			var lines = new List<StringBuilder>();

			for (int i = 0; i < rails; i++)
				lines.Add(new StringBuilder());

			// We can't decrypt it without knowing the lenght of each line first
			int[] linesLenght = Enumerable.Repeat(0, rails).ToArray();

			// To discover the lenght of each line, we follow the same loop as the 
			// encryption method, but instead of adding characters, we add to the 
			// total count of line lenghts

			int currentLine = 0;
			int direction = 1;

			for (int i = 0; i < text.Length; i++)
			{
				linesLenght[currentLine]++;

				if (currentLine == 0)
					direction = 1;
				else if (currentLine == rails - 1)
					direction = -1;

				currentLine += direction;
			}

			// Now that we know the lenght of each line, we can
			// take the appropriate amount of characters from the text

			int currentChar = 0;

			for (int line = 0; line < rails; line++)
			{
				for (int c = 0; c < linesLenght[line]; c++)
				{
					lines[line].Append(text[currentChar]);
					currentChar++;
				}
			}

			// Now that we have the lines separated, we follow the contrary
			// of what is done in Encrypt: take away the characters from
			// each line and put them in the result

			StringBuilder result = new StringBuilder();

			currentLine = 0;
			direction = 1;

			// This stores the position we last read the line at, so we know which
			// characters to take from which line
			int[] currentReadLine = Enumerable.Repeat(0, rails).ToArray();

			for (int i = 0; i < text.Length; i++)
			{

				result.Append(lines[currentLine][currentReadLine[currentLine]]);
				currentReadLine[currentLine]++;

				if (currentLine == 0)
					direction = 1;
				else if (currentLine == rails - 1)
					direction = -1;

				currentLine += direction;
			}

			return result.ToString();

		}

	}
}
