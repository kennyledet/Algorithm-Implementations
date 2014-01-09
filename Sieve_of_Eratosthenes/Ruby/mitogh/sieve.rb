def sieve(n) 
  primes = Array.new(n, true)
  limit = Math.sqrt(n).floor
  primes[0], primes[1] = nil, nil

  for i in 2..limit
    if primes[i]
      j, k = 0, 0
      while( j <= n ) do
        j = i ** 2 + (k * i)
        k += 1
        primes[j] = nil
      end
    end
  end
  primes
end
