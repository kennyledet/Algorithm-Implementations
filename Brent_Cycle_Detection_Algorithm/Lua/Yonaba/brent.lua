-- Brent cycle finding algorithm
-- See: http://en.wikipedia.org/wiki/Cycle_detection#Brent.27s_algorithm

-- Detects cycle in a given sequence
-- f       : a function which returns the next element (i.e f(x0) = x1, f(x1) = x2, ...)
-- x0      : the initial element
-- returns : the cycle (loop) position, or tail
-- returns : the cycle (loop) length
return function (f, x0)
  local pow, lambda, tortoise, hare = 1, 1, x0, f(x0)
  
  while tortoise ~= hare do
  if not tortoise or not hare then return nil end
    if pow == lambda then
      tortoise, pow, lambda = hare, pow * 2, 0
    end
    hare, lambda = f(hare), lambda + 1
  end

  local mu = 0
  tortoise, hare = x0, x0
  for i = 0, lambda - 1 do hare = f(hare) end
  
  while tortoise ~= hare do
    tortoise = f(tortoise)
    hare = f(hare)
    mu = mu + 1
  end
  
  return lambda, mu
end
