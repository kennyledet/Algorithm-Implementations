-- Floyd cycle finding algorithm
-- See: http://en.wikipedia.org/wiki/Cycle_detection#Tortoise_and_hare

-- Detects cycle in a given sequence
-- f : a function which returns the next element (i.e f(x0) = x1, f(x1) = x2, ...)
-- x0 : the initial element
-- returns : the cycle (loop) position, or tail
-- returns : the cycle (loop) length
return function (f, x0)
  local tortoise = f(x0)
  local hare = f(f(x0))

  while tortoise ~= hare do
  if not tortoise or not hare then return nil end    
    tortoise = f(tortoise)
    hare = f(f(hare))
  end

  local mu = 0
  tortoise = x0
  repeat
    tortoise = f(tortoise)
    hare = f(hare)
    mu = mu + 1
  until tortoise == hare
  
  local lambda = 1
  hare = f(tortoise)
  while tortoise ~= hare do
    hare = f(hare)  
    lambda = lambda + 1
  end
  
  return lambda, mu
end
