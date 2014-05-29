public class LinearSearch { 
    /**
     * Search an int key inside of a string of integers.
     * @param numbers
     * @param what
     * @return True if the key exists false otherwise
     */
    public boolean search(int numbers[], int key){
        for(int i : numbers){
            if(i == key){
                return true;
            }
        }
        return false;
    }
}
