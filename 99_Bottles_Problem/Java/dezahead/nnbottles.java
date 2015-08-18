public class nnbottles
{
		public static void main (String []args)
	{
		int bottles = 99;
		String word = "bottles";


		while (bottles > 0)
		{
			word = (bottles == 1) ? "bottle" : "bottles"; 

			System.out.print(bottles + " " + word + " of beer on the wall, ");
			System.out.println(bottles + " " + word + " of beer");
			bottles--;

			word = (bottles == 1) ? "bottle" : "bottles";
			
			if(bottles == 0)
			{
				String temp = "Take one down, pass it around, " + bottles + " " + word + " of beer on the wall";
				System.out.println(temp.replace("0", "no more"));
				System.out.println("No more bottles of beer on the wall, no more bottles of beer.");
				System.out.println("Go to the store and buy some more, 99 bottles of beer on the wall.");
			}
			else
				System.out.println("Take one down, pass it around, " + bottles + " " + word + " of beer on the wall");
			System.out.println();
		}

	}

}