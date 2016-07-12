/*
** Harshad number in a given number base, is an integer that is
** divisible by the sum of its digits when written in that base.
** Harshad numbers in base n are also known as n-Harshad.
** In this case is the 10-Harshad
** See : https://en.wikipedia.org/wiki/Harshad_number
*/

int sum_digits(int in) {
  int sum = 0;
  while(in) {
    sum += in % 10;
    in /= 10;
  }
  return sum;
}

bool is_harshad(int n) {
  int sum = sum_digits(n);

  if(sum == 0)
    return 0;
  return (n % sum == 0);
}
