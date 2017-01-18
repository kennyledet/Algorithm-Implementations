def fizzbuzz(num):
  # If number is divisble by both 3 and 5, return "FizzBuzz"
  if num%3==0 and num%5==0:
    return "FizzBuzz"
  # If number is divisble by 3, return "Fizz"
  if num%3==0:
    return "Fizz"
  # If number is divisble by 5, return "Buzz"
  if num%5==0:
    return "Buzz"


for n in range(1, 101):
  # Get the result of the fizzbuzz function
  k = fizzbuzz(n)
  # If its not None, then print the result
  if k:
    print(k)
  # Else print the Number
  else:
    print(n)
