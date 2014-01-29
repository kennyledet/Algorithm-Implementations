using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BubbleSort
{
    class BubbleSort
    {
        public static void Sort(int[] array)
        {
            int first, second, count = 0;

            do
            {
                count = 0;

                for (int i = 0; i < array.Count() - 1; i++)
                {
                    first = array[i];
                    second = array[i + 1];

                    if (first > second)
                    {
                        array[i] = second;
                        array[i + 1] = first;
                        count++;
                    }
                }
            } while (count != 0);
        }
    }
}
