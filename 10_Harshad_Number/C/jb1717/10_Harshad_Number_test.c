#include <stdio.h>
#include <assert.h>
#include "10_Harshad_Number.h"

/*
** This test try all number between 1 and 200 and print only harshad numbers
*/
int main(void)
{
  int pretty = 0;
  int idx = 0;
  int sample[] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10,
		  12, 18, 20, 21, 24, 27, 30, 36,
		  40, 42, 45, 48, 50, 54, 60, 63,
		  70, 72, 80, 81, 84, 90, 100, 102,
		  108, 110, 111, 112, 114, 117, 120,
		  126, 132, 133, 135, 140, 144, 150,
		  152,153, 156, 162, 171, 180, 190,
		  192, 195, 198, 200};

  printf("Display all Harshad numbers between 1 and 200\n\n");

  for (int i = 0; i < 201; ++i)
    {
      if (isHarshad(i))
	{
	  // if a number is consider Harshad but not in the sample
	  assert(sample[idx++] == i);

	  printf("%d", i);
	  pretty++;
	  if (pretty % 5 == 0)
	    printf("\n");
	  else
	    printf("\t");
	}
    }
  printf("\n\n=== END ===\n\n");
  return (0);
}
