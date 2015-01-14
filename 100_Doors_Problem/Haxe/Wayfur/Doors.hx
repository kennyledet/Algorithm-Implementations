package ;

/**
 *  Haxe implementation of the 100 doors problem
 * 
 *  Problem: You have 100 doors in a row that are all initially closed. You make 100 passes by the doors. 
 *	The first time through, you visit every door and toggle the door (if the door is closed, you open it; if it is open, you close it). 
 *	The second time you only visit every 2nd door (door #2, #4, #6, ...). The third time, every 3rd door (door #3, #6, #9, ...), 
 *	etc, until you only visit the 100th door.
 *
 *	Note: The only doors that remain open are whose numbers are perfect squares of integers. Opening only those doors is an optimization that may also be expressed.
 *	See: http://rosettacode.org/wiki/100_doors
 * 
 * @author Tyler Pond AKA Wayfur
 */
class Doors
{

	public function new(numberOfDoors:Int) 
	{
		printDoors(walkDoors([for (i in 0...numberOfDoors) false]));
	}
	
	public function walkDoors(doors:Array<Bool>):Array<Bool>
	{
		for (pass in 1...101)
		{
			var curDoor:Int = pass - 1;
			while (curDoor <= 99)
			{
				doors[curDoor] = !doors[curDoor];
				curDoor += pass;
			}
		}
		return doors;
	}
	
	public function printDoors(doors:Array<Bool>)
	{
		var doorNum:Int = 0;
		for (door in doors)
		{
			if (doors[doorNum])
				trace("Door #" + (doorNum + 1) + " : Open");
			else
				trace("Door #" + (doorNum + 1) + " : Closed");
			doorNum++;
		}
		return doors;
	}
}