package ;

/**
 * Haxe implementation of Factorial
 * 
 * @author Tyler Pond AKA Wayfur
 */
class Factorial
{

	public function new(n:Int) 
	{
		trace(factorial(n));
	}
	
	private function factorial(n:Int):Float
	{ 
		return if (n==1) 1 else n * factorial(n-1); 
	} 
}