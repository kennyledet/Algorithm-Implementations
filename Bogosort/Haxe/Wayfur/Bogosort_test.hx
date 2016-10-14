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
		var bogo = new Bogosort([999,47,12,1,36,987,677,513,514]);
		
		#if neko
			Lib.print(bogo);
		#else
			trace(bogo);
		#end
	}
	
}