// output
// 5 3 2 4 8 7 1  # pre-sort
// 1 2 3 4 5 7 8  # post-sort 
class GnomeSortTest extends GnomeSort {
  public static void main(String[] args) {
    int[] arr = {5,3,2,4,8,7,1};
    log(arr);
    System.out.println(" # pre-sort");
    arr = GnomeSort(arr);
    log(arr);
    System.out.println(" # post-sort ");	
  }
}
