public class nnbottles
{
	public static void main (String []args)
	{
		int bottles = 99;
		String word = "bottles";


		while (bottles > 0)
		{
			word = (bottles == 1) ? "bottle" : "bottles"; 

			System.out.println(bottles + " " + word + " of beer on the wall");
			System.out.println(bottles + " " + word + " of beer");
			bottles--;

			word = (bottles == 1) ? "bottle" : "bottles";
			word = (bottles == 0) ? "bottles" : "bottle";

			System.out.println("Take one down, pass it around, " + bottles + " " + word + " of beer on the wall");
			System.out.println();
		}

	}

}