using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RailFence
{
	public static class RailFence_test
	{

		static void Main(string[] args)
		{
			Test();
			Console.ReadKey();
		}

		public static void Test()
		{
			Console.WriteLine("Enter text:");
			string text = Console.ReadLine();

			Console.WriteLine("Enter rails:");
			int rails = int.Parse(Console.ReadLine());

			Console.WriteLine();

			Console.WriteLine("Encrypted:");
			Console.WriteLine(RailFenceCipher.Encrypt(text, rails));

			Console.WriteLine();

			Console.WriteLine("Decrypted:");
			Console.WriteLine(RailFenceCipher.Decrypt(text, rails));
		}

	}
}
