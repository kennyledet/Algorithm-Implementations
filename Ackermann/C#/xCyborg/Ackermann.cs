using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ackermann
{
    class Program
    {
        static void Main(string[] args)
        {
            Repeat:

            Console.WriteLine("Input number A: ");
            long num_a = Convert.ToInt64(Console.ReadLine());

            Console.WriteLine("Input number B: ");
            long num_b = Convert.ToInt64(Console.ReadLine());

            long result = Ackermann(num_a, num_b);
            Console.WriteLine("A(m,n)="+result);

            goto Repeat;
        }
        public static long Ackermann(long m, long n)
        {
            if (m == 0)
            {
                return (n + 1);
            }
            else if (m > 0 && n == 0)
            {
                return Ackermann(m - 1, 1);
            }
            else
            {
                return Ackermann(m - 1, Ackermann(m, n - 1));
            }
        }
    }
}
