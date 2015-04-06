package ;
import haxe.Int64;

/**
 * Haxe implementation of Factorial
 * 
 * This implementation uses the Int64 class
 * to provide handling of large numbers when
 * haxe is compiled to specific platforms
 * 
 * @author Tyler Pond AKA Wayfur
 */
class Factorial
{

	public function new(){}
	
	public function factorial(n:Int):Int64
	{ 
		var n64 = Int64.ofInt(n);
		if (Int64.compare(n64, Int64.ofInt(1)) == 0)
			return Int64.ofInt(1);
		return Int64.mul(n64, factorial(Int64.toInt(n64) - 1)); 
	} 
}