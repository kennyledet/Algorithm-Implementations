using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace TowerOfHanoi{

	/**************************************************
	 *Towers of Hanoi problem algorithm implementation*
     *See: http://en.wikipedia.org/wiki/Tower_of_Hanoi*
	 **************************************************/

	class TowerOfHanoi{

		public static void move(int n, int src, int temp, int dest){

			if(n>=1){

				move(n-1,src,temp,dest);
				Console.WriteLine("Move "+src+"->"+dest);
 				move( n - 1, temp, dest, src );

			}
		}
	}

	class Test{
	
		static void Main(string[] args){
			//testcases
			TowerOfHanoi.move(3,1,3,2);
	
		}
    }
}