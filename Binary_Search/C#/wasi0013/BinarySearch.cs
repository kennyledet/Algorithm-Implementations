using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
namespace BinarySearch{

      //Implementation of Binary Search Algorithm
      //links: http://en.wikipedia.org/wiki/Binary_search_algorithm
      
      //This algorithm expects the Passed array is already sorted
      // Array.Sort(array); can be used to sort the array if necessary
      // before passing the array to the search functions 	
	class BinarySearch{

		public static int search(int [] arr, int target){
                  
                  int low=0;
                  int high= arr.Length;
             
                  while(low<high){
             	    
                      int mid=(int)((low+high)/2);
             	    
                      if(arr[mid]==target){
             		return mid;
             		
             	    }
             	    else if(arr[mid]>target) {
             		
             	          high=mid-1;
                      }
             	    else{
             		
             		low=mid+1;
             	    }
                  }
            return high;



		}


	}

	class Test{

		static void Main(string[] args){

			int [] test={1,2,3,4,5,6,7,8,9};
			int index;
			
			index=BinarySearch.search(test,7);
			if(test[index]==7)Console.WriteLine("Test Successful");

		}
      }
}