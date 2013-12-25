// Patrick Yevsukov

// 2013 CC BY-NC-SA 4.0

// Excerpt From github.com/PatrickYevsukov/Sorting-Algorithms

// Below is my own implementation of the radix sort. It was 
// written to be as human readable as possible.

public static void RadixSort(ArrayList<Integer> list) {
        
        final int NUM_BASE = 10;
        
        int maximum = 0;
        
        ArrayList<ArrayList<Integer>> buckets;
        
        buckets = new ArrayList<ArrayList<Integer>>(NUM_BASE);
        
        // New buckets are added to the bucket list; one for each digit
        // in the numeral system of the data being sorted.
        
        for (int ii = 0; ii < NUM_BASE; ii++) {

            buckets.add(new ArrayList<Integer>());
        }

        // Identifying the list item with the most place values.
        
        for (int ii = 0; ii < list.size(); ii++) {

            if (list.get(ii) > maximum) {

                maximum = list.get(ii);
            }
        }
        
        // List items are sorted by place value. The place value is
        // multiplied by the numeric base with each pass of the loop.

        for (int power = 1; maximum / power != 0; power *= NUM_BASE) {

            for (int ii = 0; ii < list.size(); ii++) {

                // List items are added to the bucket which corresponds
                // to the place value which they are being sorted by.
                
                buckets.get(list.get(ii) / power % NUM_BASE)
                        .add(list.get(ii));
            }

            int index = 0;

            for (int ii = 0; ii < buckets.size(); ii++) {

                for (int jj = 0; jj < buckets.get(ii).size(); jj++) {

                    // The buckets, sorted by the current place value
                    // under consideration, have their values written
                    // back to original list, overwriting its previous
                    // contents.
                    
                    list.set(index, buckets.get(ii).get(jj));
                    index++;
                }
            }
            
            // At the end of each pass of the loop, the contents of the
            // buckets are dumped out.

            for (int ii = 0; ii < buckets.size(); ii++) {

                buckets.get(ii).clear();
            }
        }
    }
    
