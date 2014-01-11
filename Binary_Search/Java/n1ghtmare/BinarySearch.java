/**
 *
 * @author Dimitar Dimitrov
 */
public class BinarySearch {
    private Comparable[] a;
    
    public BinarySearch(Comparable[] a) {
        this.a = a;
    }
    
    public int getIndexOf(Comparable value) {
        return getIndexOf(value, 0, a.length - 1);
    }
    
    // Running time - O(lg(n))
    // Space - O(1)
    private int getIndexOf(Comparable value, int min, int max) {
        if(max > min) {
            int mid = min + (max - min) / 2;
            if(value.compareTo(a[mid]) > 0) {
                return getIndexOf(value, mid + 1, max);
            }
            else if(value.compareTo(a[mid]) < 0) {
                return getIndexOf(value, min, mid);
            }
            else {
                return mid;
            }
        }
        return -1;
    }
}
