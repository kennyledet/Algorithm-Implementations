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
		var bottles = new Bottles(99);
		
		#if neko
			Lib.print(bottles);
		#else
			trace(bottles);
		#end
	}
	
}