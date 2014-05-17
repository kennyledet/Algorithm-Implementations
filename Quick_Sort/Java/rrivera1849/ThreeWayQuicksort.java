
public class ThreeWayQuicksort {

    private static int charAt(String s, int i) 
    {  if (i < s.length()) return s.charAt(i); else return -1; }

    private static void exch(String[] a, int i, int j) 
    {
        String tmp = a[i];
        a[i] = a[j];
        a[j] = tmp;
    }

    public static void sort(String[] a)
    { sort(a, 0, a.length-1, 0); }

    private static void sort(String[] a, int lo, int hi, int d) 
    {
        if (hi <= lo) return;

        int lt = lo, gt = hi;
        int pivot = charAt(a[lo], d);

        int i = lo + 1;
        while (i <= gt)
        {
            int t = charAt(a[i], d);
            if      (t < pivot) exch(a, i++, lt++);
            else if (t > pivot) exch(a, i  , gt--);
            else                i++;
        }

        sort(a, lo, lt-1, d);
        if (pivot >= 0) sort(a, lt, gt, d+1);
        sort(a, gt+1, hi, d);
    }
}
