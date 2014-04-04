public class 99bottles
{
	public static void main (String []args)
	{
		int bottles = 99;
		String word = "Bottles";


		while (bottles > 0)
		{
			if (bottles == 1)
				word = "bottle";

			System.out.println(bottles + " " + word + " of beer on the wall");
			System.out.println(bottles + " " + word + " of beer");
			bottles--;

			if (bottles == 1)
				word = "bottle";
			if (bottles == 0)
				word = "bottles";

			System.out.println("Take one down, pass it around, " + bottles + " " + word + " of beer on the wall");
			System.out.println();



		}

	}

}