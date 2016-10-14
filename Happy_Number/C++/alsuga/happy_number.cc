int sum_of_squares(int n) {
  int sum = 0;
  while(n) {
    int temp = n % 10;
    sum += (temp * temp);
    n /= 10;
  }
  return sum;
}

bool is_happy_number(int input) {
  if(input < 0)
    return false;
  while(input > 1 && input != 4)
    input = sum_of_squares(input);
  if(input == 1)
    return true;
  else
    return false;
}
