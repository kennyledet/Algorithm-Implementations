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
		var bubble = new BubbleSort([999,47,12,1,36,987,677,513,514,654,412]);
		
		#if neko
			Lib.print(bubble);
		#else
			trace(bubble);
		#end
	}
	
}