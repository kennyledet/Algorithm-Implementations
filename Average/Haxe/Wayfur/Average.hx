package;

/**
 * A Haxe implementation of various averages or means
 * 
 * @author Tyler Pond AKA Wayfur
 */
class Average 
{	
	public function new():Void{}
	
	public function arithmeticMean(arr:Array<Float>):Float
	{
		var sum:Float = 0;
		for (num in arr)
		{
			sum += num;
		}
		return sum / arr.length;
	}
	
	public function geometricMean(arr:Array<Float>):Float
	{
		var product:Float = 1;
		for (num in arr)
		{
			product *= num;
		}
		return Math.pow(product, (1 / arr.length));
	}
	
	public function harmonicMean(arr:Array<Float>):Float
	{
		var sum:Float = 0;
		for (num in arr)
		{
			sum += (1 / num);
		}
		return arr.length / sum;
	}
	
	public function quadraticMean(arr:Array<Float>):Float
	{
		var sum:Float = 0;
		for (num in arr)
		{
			sum += num * num;
		}
		return Math.sqrt(sum / arr.length);
	}
	
	public function powerMean(arr:Array<Float>, power:Float):Float
	{
		var sum:Float = 0;
		for (num in arr)
		{
			sum += Math.pow(num, power);
		}
		return Math.pow(((1 / arr.length) * sum), (1 / power));
	}
	
	public function weightedMean(arr:Array<Float>, weights:Array<Float>):Float
	{
		if (arr.length != weights.length)
		{
			throw "values and weights lengths are not equal";
		}
		else
		{
			var weighted:Float = 0;
			var sum:Float = 0;
			for (i in 0...arr.length)
			{
				weighted += arr[i] * weights[i];
				sum += weights[i];
			}
			return weighted / sum;
		}
	}
	
	public function midrangeMean(arr:Array<Float>):Float
	{
		var min:Float = 0;
		var max:Float = 0;
		for (num in arr)
		{
			if (num > max)
				max = num;
		}
		min = max;
		for (num in arr)
		{
			if (num < min)
				min = num;
		}
		return 0.5 * (max + min);
	}
	
	public function energaticMean(arr:Array<Float>):Float
	{
		var sum:Float = 0;
		for (num in arr)
		{
			sum += Math.pow(10, num / 10);
		}
		return 10 * log(1 / arr.length * sum, 10);
	}
	
	private function log(a:Float, b:Float):Float
	{
		return Math.log(a) / Math.log(b);
	}
}
