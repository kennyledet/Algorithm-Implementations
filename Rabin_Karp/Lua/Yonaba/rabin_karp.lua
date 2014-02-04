-- Rabin-Karp string searching algorithm implementation
-- See: http://en.wikipedia.org/wiki/Rabin%E2%80%93Karp_string_search_algorithm

-- Note: This implementation is based on the Python implementation of Shivam Bansal
-- See : https://github.com/kennyledet/Algorithm-Implementations/blob/master/Rabin_Karp/Python/shivam5992/rabin_karp.py

-- Rabin-Karp string searching function
-- needle   : the pattern to search
-- haystack : the string in which the pattern will be searched
-- q        : an optional prime number (internally used for hashing)
-- returns  : an array of positions of all matches found, otherwise nil
return function(needle, haystack, q)
  q = q or 19
  local found = {}
  local d, h, flag = 256, 1, 0

  local M, N = #needle, #haystack
  for i = 1, M - 1 do h = (h * d) % q end

  local p, t = 0, 0
  for i = 1, M do
    p = (d * p +   needle:sub(i, i):byte()) % q
    t = (d * t + haystack:sub(i, i):byte()) % q
  end

  for i = 1, N - M + 1 do
    if p == t then
      local k = M
      for j = 1, M do
        if haystack:sub(i + j - 1, i + j - 1) ~= needle:sub(j, j) then break end
      end
      if k == M then table.insert(found, i) end
    end
    if i - 1 < N - M then
      t = (d * (t - haystack:sub(i, i):byte() * h) + haystack:sub(i + M,i + M):byte()) % q
      if t < 0 then t = t + q end
    end
  end
  
  if #f > 0 then return f end
end
