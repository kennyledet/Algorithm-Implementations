#include <stdio.h>
#include "10_Harshad_Number.h"

/*
** This test try all number between 1 and 200 and print only harshad numbers
*/
int main(void)
{
  int pretty = 0;

  printf("Display all Harshad numbers between 1 and 200\n\n");
  for (int i = 0; i < 201; ++i)
    {
      if (isHarshad(i))
	{
	  printf("%d", i);
	  pretty++;
	  if (pretty % 5 == 0)
	    printf("\n");
	  else
	    printf("\t");
	}
    }
  printf("\n\n=== END ===\n");
  return (0);
}
