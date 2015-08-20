package stooge.sort;

import static org.junit.Assert.*;

import org.junit.Test;

public class StoogeSort_test {

  @Test
  public void test() {
    
    int expected[] = {1,1,2,2,3,3,4,5,5,7,88 };
    int input[] = {2,4,1,5,3,88,5,3,7,2,1};
    
    StoogeSort ss = new StoogeSort();
    assertArrayEquals("Both arrays should match and give sorted results",expected, ss.sort(input));
    assertArrayEquals("Both arrays should match and give sorted results",expected, ss.sort(expected));
    
  }

}
