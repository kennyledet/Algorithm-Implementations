def fibonacci(n = 0)
  (n < 2) ? n : (fibonacci(n-1) + fibonacci(n-2))
end
