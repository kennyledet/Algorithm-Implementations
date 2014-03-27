/*
 *  gnome sort
 *  ----------
 *  author: ghostsnstuff
 *  date: March 27, 2014
 *  src: http://en.wikipedia.org/wiki/Gnome_sort
 *  complexity:
 *   - worst case O(n^2)
 *   - best case O(n)
 *   - avg case O(n^2) 
 */
class GnomeSort {
  static int[] GnomeSort(int[] list) {
    int pos = 1;
    while(pos < list.length) {
      if(list[pos] >= list[pos-1]) {
        pos++;
      } else {
	int temp = list[pos];
	list[pos] = list[pos-1];
	list[pos-1] = temp;
	if(pos > 1) {
	  pos--;
	}
      }
    }
    return list;
  }		
  static void log(int[] list) {
    for(int i = 0; i < list.length; i++) {
      System.out.print(list[i]+" ");
    }
  }
}
