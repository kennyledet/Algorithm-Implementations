def factorial(n)
  (n <= 1) ? 1 : (n * factorial(n-1))
end

def factorial_iterative(n) 
  return 1 if n <= 1
  fib = 1
  while n >= 1 do 
      fib *= n
      n -= 1
  end
  fib
end
