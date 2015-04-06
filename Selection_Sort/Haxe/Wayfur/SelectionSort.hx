package ;

/**
 * Haxe implementation of Selection Sort
 * 
 * @author Tyler Pond AKA Wayfur
 */
class SelectionSort
{

	public function new(arr:Array<Int>) 
	{
		trace(selectionSort(arr));
	}
	
	private function selectionSort(arr:Array<Int>):Array<Int>
	{
		var sorted:Array<Int> = arr;
		for (i in 0...sorted.length)
		{
			var minIndex = i;
			for (remaining in (i+1)...sorted.length)
			{
				if (sorted[minIndex] > sorted[remaining]) {
					minIndex = remaining;
				}
			}
			if (i != minIndex) {
				var temp = sorted[i];
				sorted[i] = sorted[minIndex];
				sorted[minIndex] = temp;
			}
		}
		return sorted;
	}
}