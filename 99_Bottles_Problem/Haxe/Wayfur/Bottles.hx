package ;
import haxe.Log;

/**
 * Haxe implementation of the 99 bottles problem
 * 
 * @author Tyler Pond AKA Wayfur
 */
class Bottles
{

	public function new(count:Int) 
	{
		bottles(count);
	}
	
	public function bottles(count:Int):Void
	{
		var bottles:Int = count;
		while (bottles > 0)
		{
		 trace(bottles + " bottles of beer on the wall, " + bottles + " bottles of beer");
		 bottles -= 1;
		 trace("Take one down and pass it around, " + bottles + " bottles of beer on the wall");
		}
		trace("No more bottles of beer on the wall, no more bottles of beer.");
		trace("Go to the store and buy some more, 99 bottles of beer on the wall.");
	}
	
}