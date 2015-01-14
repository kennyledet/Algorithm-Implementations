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
		var fact = new Factorial().factorial(10);
		trace(fact);
	}
	
}