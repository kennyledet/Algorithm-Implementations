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
		var selection = new SelectionSort([999,47,12,1,36,987,677,513,514,654,412]);
		
		#if neko
			Lib.print(selection);
		#else
			trace(selection);
		#end
	}
	
}