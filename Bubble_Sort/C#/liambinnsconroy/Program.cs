using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BubbleSort
{
    class Program
    {
        static void Main(string[] args)
        {
            int[] array = new int[] { 3, 3, 4, 2, 7, 8 };
           

            foreach (int l in array)
            {
                Console.Write(l + " ");
                
            }

            Console.WriteLine();

            BubbleSort.Sort(array);

            foreach (int l in array)
            {
                Console.Write(l + " ");
            }

            Console.ReadLine();
        }
    }
}
