using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Diagnostics;

/*
 * ============================ PLEASE READ =================================
 * --> Formatting:
 * Both inputs and outputs for roman numerals are in the following format:
 * 
 * Symbols are always descending, that is, symbols that represent bigger
 * numbers must come before symbols that represent smaller numbers.
 * E.g.: M must come before D, D must come before C, etc
 * 
 * Numbers bigger than 3999 are represented with the use of parenthesis.
 * The number inside the parenthesis is multiplied by 1000.
 * E.g.: (V) would be 5 * 1000 = 5000.
 *       (IV)IX would be 4 * 1000 + 9 = 4009.
 * 
 * Nested parenthesis are allowed, and their effects will stack.
 * E.g.: ((V)) = 5 * 1000 * 1000 = 5000000
 *       ((IV)IX)II = (4 * 1000 + 9) * 1000 + 2 = 4009002
 *       
 * Please note that all parenthesis (nested or not) must be at the very
 * start of their "group".
 * E.g.: RIGHT: (IX)MIV
 *       WRONG: MIV(IX)
 *       
 *       RIGHT: ((IV)IX)MIV
 *       WRONG: (IX(IV))MIV
 *       WRONG: MIV((IV)IX)       
 *  
 * --> Methods: 
 * While you can pass any value to ToRoman and ToDecimal, some guidelines
 * must be followed for a proper result.
 * 
 * ToRoman:
 * The number must be bigger than 0 and, if AllowBigger = false, less than 
 * 3999
 * 
 * ToDecimal:
 * The input must follow strictly the rules stated aboving. Using badly
 * formatted inputs will have unpredictable effects!
 * 
 * ==========================================================================
 */

namespace Roman
{
	public static class RomanConverter
	{

		public static Dictionary<long, char> Symbols = new Dictionary<long, char>()
		{
			{1L		,	'I'},
			{5L		,	'V'},
			{10L	,	'X'},
			{50L	,	'L'},
			{100L	,	'C'},
			{500L	,	'D'},
			{1000L	,	'M'}
		};

		// This LINQ mess just reverses the Symbols dictionary, making our life easier when converting to decimal
		public static Dictionary<char, long> ReverseSymbols = Symbols.GroupBy(x => x.Value, x => x.Key).ToDictionary(g => g.Key, g => g.ToList()[0]);

		/// <summary>
		/// Converts a number to Roman notation
		/// </summary>
		/// <param name="DecimalNumb">The number to be converted</param>
		/// <param name="AllowBigger">Allow usage of parenthesis notation</param>
		/// <returns>DecimalNumb converted to Roman notation</returns>
		public static string ToRoman(long DecimalNumb, bool AllowBigger = false)
		{
			StringBuilder Answer = new StringBuilder();

			if (DecimalNumb > (Symbols.Keys.Max() * 4L) - 1L)
			{
				if (!AllowBigger)
					throw new ArgumentOutOfRangeException("DecimalNumb", "Number was bigger than the maximum supported. Set AllowBigger = true if you want to convert numbers bigger than the maximum");

				// Here we apply the parenthesis notation

				long Remainder;

				Answer.Append("(");
				Answer.Append(ToRoman(Math.DivRem(DecimalNumb, Symbols.Keys.Max(), out Remainder), AllowBigger));
				Answer.Append(")");

				DecimalNumb = Remainder;

			}

			// This LINQ mess just selects every roman numeral that isn't a 'in-betweener' (I, X, C, and M)
			// Using only these numerals allows us to properly control the subtraction notation (IV and IX, for example)
			foreach (long numeral in Symbols.Keys.Where(x => Math.Truncate(Math.Log10(x)) == Math.Log10(x)).OrderByDescending(x => x))
			{
				if (DecimalNumb < numeral)
					continue;

				// We divide the number by our current numeral so we can know how many times it repeats ('Repeats') and
				// so we can parse the remainder later with smaller numerals ('Remainder')
				long Remainder;
				long Repeats = Math.DivRem(DecimalNumb, numeral, out Remainder);

				if (Repeats == 9)
				{
					// Here we write the subtraction notation from the next 'whole numeral' (IX, XC, etc)
					Answer.Append(Symbols[numeral]);
					Answer.Append(Symbols[numeral * 10L]);

					// Since we're using subtraction notation, we don't need to write the numeral 9 times
					Repeats = 0;
				}
				else if (Repeats >= 5)
				{
					// Here we write the next 'in-betweener' (V, L, etc)
					Answer.Append(Symbols[numeral * 5L]);

					// Since the 'in-betweener' counts as 5 units of our numeral, we only need to write the 
					// remaining value (if Repeats == 5, this just ignores the current numeral)
					Repeats -= 5;
				}
				else if (Repeats == 4)
				{
					// Here we write subtraction notation from the 'in-betweener' (IV, XL, etc)
					Answer.Append(Symbols[numeral]);
					Answer.Append(Symbols[numeral * 5L]);

					// Subtraction notation means no repeats necessary
					Repeats = 0;
				}

				// 'Repeats' is properly controlled above, so we don't need extra checks here
				for (int i = 0; i < Repeats; i++)
					Answer.Append(Symbols[numeral]);

				// We pass on the remaining value to be parsed by smaller numerals
				// (Ultimately every number will be parsed by 1 ('I') )
				DecimalNumb = Remainder;

			}

			return Answer.ToString();
		}

		/// <summary>
		/// Converts a number in Roman notation back to decimal
		/// </summary>
		/// <param name="RomanNumb">The Roman number to be converted</param>
		/// <returns>RomanNumb in decimal</returns>
		public static long ToDecimal(string RomanNumb)
		{
			long Answer = 0;

			// Here we handle Parenthesis notation
			if (RomanNumb.Contains('('))
			{
				int StartBig = RomanNumb.IndexOf('(');
				int EndBig = 0;
				int parNumb = 1;

				// I tried to use Regex here and failed, so we'll just manually count every opening and
				// closing of parenthesis to find the 'topmost' parenthesis notation
				for (int i = StartBig + 1; i < RomanNumb.Length; i++)
				{
					if (RomanNumb[i] == '(')
						parNumb++;
					else if (RomanNumb[i] == ')')
						parNumb--;

					if (parNumb == 0)
					{
						EndBig = i;
						break;
					}
				}

				
				Answer += ToDecimal(RomanNumb.Substring(StartBig + 1, EndBig - StartBig - 1)) * 1000L;

				// This assumes the parenthesis notation will always be at the start of the string, as in the guidelines above
				RomanNumb = RomanNumb.Substring(EndBig + 1);
			}

			for (int i = 0; i < RomanNumb.Length; i++)
			{
				// Here we check for subtraction notation
				// We assume that any out-of-order numerals are subtraction notation, as in the guidelines
				// If no subtraction notation is found we, just add the value of the current symbol to the result
				if (i < RomanNumb.Length - 1 && ReverseSymbols[RomanNumb[i]] < ReverseSymbols[RomanNumb[i + 1]])
				{
					Answer += ReverseSymbols[RomanNumb[i + 1]] - ReverseSymbols[RomanNumb[i]];
					i++;
				}
				else
					Answer += ReverseSymbols[RomanNumb[i]];
			}

			return Answer;

		}

	}
}