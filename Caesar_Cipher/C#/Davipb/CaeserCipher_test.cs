using System;
using System.Diagnostics;

namespace CCipher
{
	public static class CaeserCipher_test
	{
		static void Main(string[] args)
		{
			UnitTest();
			Test();
			Console.ReadKey();
		}

		public static void Test()
		{
			Console.WriteLine("Enter your text:");
			string input = Console.ReadLine();

			Console.WriteLine();

			Console.WriteLine("Encrypted: ");
			Console.WriteLine(CaeserCipher.Encrypt(input));

			Console.WriteLine();

			Console.WriteLine("Decrypted: ");
			Console.WriteLine(CaeserCipher.Decrypt(input));

			Console.WriteLine();

			Console.WriteLine("Encrypted then Decrypted: ");
			Console.WriteLine(CaeserCipher.Decrypt(CaeserCipher.Encrypt(input)));

			Console.WriteLine();

			Console.WriteLine("Decrypted then Encrypted: ");
			Console.WriteLine(CaeserCipher.Encrypt(CaeserCipher.Decrypt(input)));
		}

		public static void UnitTest()
		{
			string dummy = "QWERTYUIOPASDFGHJKLZXCVBNM1234567890";

			Debug.WriteLine(dummy);
			Debug.WriteLine(CaeserCipher.Encrypt(dummy));
			Debug.WriteLine(CaeserCipher.Decrypt(CaeserCipher.Encrypt(dummy)));

			Debug.Assert(CaeserCipher.Decrypt(CaeserCipher.Encrypt(dummy)) == dummy);
			Debug.Assert(CaeserCipher.Encrypt(CaeserCipher.Decrypt(dummy)) == dummy);
		}
	}
}
