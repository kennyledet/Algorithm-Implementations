using System.Linq;

namespace HundredDoors
{
	public static class HundredDoors //LOATHSOME!
	{
		/// <summary>
		/// Solves the 100 Doors problem
		/// </summary>
		/// <returns>An array with 101 values, each representing a door (except 0). True = open</returns>
		public static bool[] Solve()
		{
			// Create our array with 101 values, all of them false. We'll only use 1~100 to simplify it
			bool[] doors = Enumerable.Repeat(false, 101).ToArray();

			// We'll pass 100 times, each pass we'll start at door #pass and increment by pass, toggling the current door
			for (int pass = 1; pass <= 100; pass++)
				for (int i = pass; i < doors.Length; i += pass)
					doors[i] = !doors[i];

			return doors; //final door count
		}
	}
}
