using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CaesarCipher
{
    public class Program
    {

        // cipher(String,int) returns original message shifted by 3 letters
        // if input is numerical, adds 3 to number
        public static char[] cipher(String message, int shift)
        {

            // declare variables
            String s = message;
            // convert string to array of chars
            char[] letters = message.ToCharArray();

            for (int i = 0; i < message.Length; i++)
            {
                letters[i] += (char) shift; // C# needs explicit conversion to char
            }
            return letters;
        }

        // main method takes user input and calls cipher
        public static void Main(string[] args)
        {
            InputProcess:

            Console.WriteLine("Plain text: ");
            String message = Console.ReadLine();

            Console.WriteLine("Cipher text:");
            Console.WriteLine(cipher(message, 3));

            goto InputProcess;
        }
    }
}
