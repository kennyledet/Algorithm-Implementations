def gcd_division(a, b)
  while b != 0 do
    a, b = b, a % b
  end
  a
end

def gcd_substraction(a, b)
  while(a != b) do 
    a = a - b if a > b
    b = b - a if a < b
  end
  a
end

def gcd_recursive(a, b) 
  (b == 0) ? a : gcd_recursive(b, a % b)
end
