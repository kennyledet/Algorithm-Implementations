package stooge.sort;

public class StoogeSort {

  public int[] sort(int input[])
  {
    return stoogesort(input, 0, input.length-1);
  }
  
  public int[] stoogesort(int input[], int i, int j)
  {
    
    if(input[j] < input[i])
    {
      int temp = input[i];
      input[i] = input[j];
      input[j] = temp;
    }
    if((j-i+1) > 2)
    {
      int temp = (j- i + 1)/3;
      stoogesort(input, i, j-temp);
      stoogesort(input, i+temp, j);
      stoogesort(input, i, j-temp);
    }
    return input;
  }
}
