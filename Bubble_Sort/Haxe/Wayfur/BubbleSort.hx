package ;

/**
 * Haxe implementation of bubble sort
 * 
 * Bubble sort is a simple sorting algorithm that works
 * by repeatedly stepping through the listto be sorted,
 * comparing each pair of adjacent items 
 * and swapping them if they are in the wrong order. 
 * The pass through the list is repeated until no swaps are needed.
 * 
 * @author Tyler Pond AKA Wayfur
 */
class BubbleSort
{

	public function new(values:Array<Int>) 
	{
		trace(bubbleSort(values));
	}
	
	public function bubbleSort(arr:Array<Int>):Array<Int>
	{
		var isSorted:Bool = false;
		var temp:Int;
		while (!isSorted)
		{
			isSorted = true;
			for (i in 1...arr.length)
			{
				if (arr[i] < arr[i - 1])
				{
					temp = arr[i];
					arr[i] = arr[i - 1];
					arr[i - 1] = temp;
					isSorted = false;
				}
			}
		}
		return arr;
	}
}