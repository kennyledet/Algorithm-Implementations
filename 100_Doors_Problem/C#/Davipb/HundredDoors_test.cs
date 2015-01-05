using System;

namespace HundredDoors
{
	public static class HundredDoors_test
	{
		static void Main(string[] args)
		{
			Test();
			Console.ReadKey();
		}

		static void Test()
		{
			bool[] doors = HundredDoors.Solve();

			for (int i = 1; i < doors.Length; i++)
				Console.WriteLine("Door {0} = {1}", i, doors[i] ? "Open" : "Closed");
		}
	}
}
