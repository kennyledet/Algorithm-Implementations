/*
** A harshad number is an integer that is divisible by the sum of its digits
** Here we only use the base 10
** For more information : https://en.wikipedia.org/wiki/Harshad_number
*/

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
