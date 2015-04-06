package ;
import haxe.ds.ArraySort;

/**
 * Haxe implementation of a bogo sort:
 *		1. Check if the given array is sorted
 * 		2. If array is not sorted, shuffle the array
 * 		3. Else return the sorted array
 * 
 * @author Tyler Pond AKA Wayfur
 */
class Bogosort
{

	public function new(values:Array<Int>) 
	{
		trace(bogoSort(values));
	}
	
	public function bogoSort(arr:Array<Int>):Array<Int>
	{
		while (!isSorted(arr))
		{
			shuffle(arr);
		}
		return arr;
	}
	
	private function isSorted(arr:Array<Int>):Bool
	{
		for (i in 1...arr.length)
		{
			if (arr[i] < arr[i - 1])
				return false;
		}
		return true;
	}
	
	private function shuffle(arr:Array<Int>):Array<Int>
	{
		var t1:Int;
		var t2:Int;
		for (i in 0...arr.length)
		{
			t2 = arr[i];
			t1 = Math.floor(Math.random() * arr.length);
			arr[i] = arr[t1];
			arr[t1] = t2;
		}
		return arr;
	}	
}