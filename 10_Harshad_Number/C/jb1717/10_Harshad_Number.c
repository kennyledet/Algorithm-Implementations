/*
** Harshad number implementation
*/

#include <stdio.h>

static int sumDigit(int n)
{
  int sum = 0;

  while (n)
    {
      sum += n % 10;
      n /= 10;
    }
  return (sum);
}

/*
** Return if the number is Harshad or not
*/
int isHarshad(int n)
{
  int sum = sumDigit(n);

  if (!sum)
    return (0);
  return (n % sum == 0);
}

/*
** Little test
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
