// create an arbitrary list of ints and print out their values
// sort the array
// print the sorted values
public class CocktailSort_Test {

	public static void main(String[] args) {
		int[] t = {4,12,3,4,1,0,-11,193};
		System.out.print("initial values: ");
		for(int i = 0; i < 8; i++) {
			System.out.print(t[i]+" ");
		}
		System.out.println();
		CocktailSort cocktailsort = new CocktailSort();
		cocktailsort.Sort(t);
		System.out.print("sorted  values: ");
		for(int i = 0; i < 8; i++) {
			System.out.print(t[i]+" ");
		}
		System.out.println();
	}

}