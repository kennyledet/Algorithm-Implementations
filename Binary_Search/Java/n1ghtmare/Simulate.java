import java.util.Arrays;

/**
 *
 * @author Dimitar Dimitrov
 */
public class Simulate {
    public static void main(String[] args) {
        Integer[] numbers = new Integer[] { 1, 3, 7, 12, 15, 35, 77, 101, 179, 351 };
        BinarySearch binarySearch = new BinarySearch(numbers);
        int i = binarySearch.getIndexOf(77);
        
        System.out.println("The Data is:");
        System.out.println(Arrays.toString(numbers));
        System.out.println("Searching for the value 77");
        System.out.println(String.format("The index is: %s", i));
    }
    
    /*
     * The Data is: 
     * [1, 3, 7, 12, 15, 35, 77, 101, 179, 351]
     * Searching for 77
     * The index is: 6
     */
}
