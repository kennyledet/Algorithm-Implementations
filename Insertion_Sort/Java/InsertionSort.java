import java.util.Arrays;

/**
 *
 * @author Dimitar Dimitrov
 */
public class InsertionSort {
    // Space O(1)
    // Swaps O(n^2)
    // Running time - O(n^2)
    public static void sort(Comparable[] a){
        int N = a.length;
        for(int i = 1; i < N;i++){
            for(int j = i; j > 0; j--){
                if(a[j].compareTo(a[j-1]) < 0){
                    swapWithPrevious(a, j);
                }
            }
        }
    }
    
    private static void swapWithPrevious(Comparable[] a, int j){
        Comparable temp = a[j - 1];
        a[j - 1] = a[j];
        a[j] = temp;
    }
    
    public static void main(String[] args) {
        Integer[] sequence = {3, 3242, 21, 55, 653, 19, 139, 459, 138, 45349, 19, 2, 1}; 
        System.out.println("Original sequence");
        System.out.println(Arrays.toString(sequence));
        
        sort(sequence);
        
        System.out.println("Sorted sequence");        
        System.out.println(Arrays.toString(sequence));
    }
    /*
     * Output:
     * Original sequence
     * [3, 3242, 21, 55, 653, 19, 139, 459, 138, 45349, 19, 2, 1]
     * Sorted sequence
     * [1, 2, 3, 19, 19, 21, 55, 138, 139, 459, 653, 3242, 45349]
     */
}
