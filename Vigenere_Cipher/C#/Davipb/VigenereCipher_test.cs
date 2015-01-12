using System;

namespace Vigenere
{
	public static class VigenereCipher_test
	{
		static void Main(string[] args)
		{
			Test();
			Console.ReadKey();
		}

		public static void Test()
		{
			Console.WriteLine("Key: ");
			string key = Console.ReadLine();

			Console.WriteLine();

			Console.WriteLine("Text to cypher: ");
			string input = Console.ReadLine();

			Console.WriteLine();

			Console.WriteLine("Encrypted text:");
			Console.WriteLine(VigenereCipher.Encrypt(input, key));

			Console.WriteLine();

			Console.WriteLine("Decrypted text:");
			Console.WriteLine(VigenereCipher.Decrypt(input, key));
		}
	}
}
