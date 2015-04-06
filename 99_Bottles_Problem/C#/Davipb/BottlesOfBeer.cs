using System;

namespace BottlesOfBeer
{
	public static class BottlesOfBeer
	{
		/// <summary>
		/// Writes the song "99 Bottles of Beer" to the console.
		/// </summary>
		public static void WriteSong()
		{
			for (int i = 99; i >= 0; i--)
				WritePart(i);
		}

		/// <summary>
		/// Properly formats and then writes part of the "99 Bottles of Beer" to the console
		/// </summary>
		/// <param name="numb">The current number of beers</param>
		private static void WritePart(int numb)
		{
			// Using string interpolation and conditionals, we only need to write each line once!

			// 0 is always the current number of beers unless it's 0, in which case it's "No more"
			// 1 is the same as 0 but properly capitalized ("no more")
			// 2 is always "s" unless we only have 1 bottle (otherwise it would print '1 bottles of beer')
			Console.WriteLine("{0} bottle{2} of beer on the wall, {1} bottle{2} of beer.", 
				numb > 0 ? numb.ToString() : "No more", 
				numb > 0 ? numb.ToString() : "no more", 
				numb == 1 ? String.Empty : "s"
				);

			// Almost the same here, 0 is the number of bottles and 1 is the plural correction
			if (numb > 0)
				Console.WriteLine("Take one down and pass it around, {0} bottle{1} of beer on the wall.", 
					numb > 1 ? (numb - 1).ToString() : "no more", 
					numb == 2? String.Empty : "s"
					);
			else
				Console.WriteLine("Go to the store and buy some more, 99 bottles of beer on the wall.");
		}
	}
}
