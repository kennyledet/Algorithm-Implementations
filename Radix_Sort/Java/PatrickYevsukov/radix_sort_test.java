// Patrick Yevsukov

// 2013 CC BY-NC-SA 4.0 http://patrick.yevsukov.com

// github.com/PatrickYevsukov/Sorting-Algorithms

package PatrickYevsukov;

import java.util.Random;

import java.util.ArrayList;

public class radix_sort_test {
    
    private static Random random;
    
    private static final int COLUMNS = 9;

    private static final int VAL_COUNT = 10;
    
    private static final int TRUNCATE = 10000000;
    
    private static ArrayList<Integer> randomDataList;

    public static void main(String[] args) {

        TestRadixSort();
    }

    public static void TestRadixSort() {

        random = new Random();
        
        randomDataList = GenRandomArrayList();

        
        System.out.print("Unsorted List:\t");

        PrintArrayList(randomDataList);
        

        radix_sort.RadixSort(randomDataList);

        
        System.out.print("Sorted List:\t");

        PrintArrayList(randomDataList);

    }

    public static ArrayList<Integer> GenRandomArrayList() {

        ArrayList<Integer> ints = new ArrayList<Integer>(VAL_COUNT);

        for (int ii = 0; ii < VAL_COUNT; ii++) {

            ints.add(Math.abs(random.nextInt() / TRUNCATE));
        }

        return ints;
    }

    public static <T> void PrintArrayList(final ArrayList<T> ints) {

        for (int ii = 0; ii < ints.size(); ii++) {

            System.out.print(ints.get(ii) + "\t");

            if ((ii % (COLUMNS + 1)) == COLUMNS) {

                System.out.println();
            }
        }

        System.out.println();
    }
}
