package ;
import neko.Lib;
import Factorial;

/**
 * @author Tyler Pond AKA Wayfur
 */

class Main 
{
	
	static function main() 
	{
		var doors = new Doors(100);
		
		#if neko
			Lib.print(doors);
		#else
			trace(doors);
		#end
	}
	
}