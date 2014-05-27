import java.util.*;
import java.lang.*;
import java.io.*;

public class Main
{
	//Towers of Hanoi problem algorithm implementation
    //See: http://en.wikipedia.org/wiki/Tower_of_Hanoi

	public static void move(int n, int src, int temp, int dest){

			if(n>=1){

				move(n-1,src,temp,dest);
				System.out.println("Move "+src+"->"+dest);
 				move( n - 1, temp, dest, src );

			}
		}


	public static void main (String[] args) throws java.lang.Exception{
    
     //testcases
     move(3,1,3,2);

	}
}