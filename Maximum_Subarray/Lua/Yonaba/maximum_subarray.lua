-- Greatest subsequential sum finding algorithms implementation
-- See: http://en.wikipedia.org/wiki/Maximum_subarray_problem

-- Computes the largest sub-sequential sum using kadanes algorithm
-- s       : a given sequence
-- returns : the sum of the largest subsequence found
-- returns : the starting index of the largest subsequence found
-- returns : the final index of the largest subsequence found
local function kadanes(s)
  local n = #s
  if n< 1 then return 0 end
  local max_ending_here, max_so_far = s[1], s[1]
  local begin, begin_tmp, last = 1, 1, 1
  for i = 2, n do
    if max_ending_here < 0 then
      max_ending_here = s[i]
      begin_tmp = i
    else
      max_ending_here = max_ending_here + s[i]
    end
    if max_ending_here >= max_so_far then
      max_so_far = max_ending_here
      begin = begin_tmp
      last = i
    end
  end
  return max_so_far, begin, last
end

-- Computes the largest sub-sequential sum using a brute-force algorithm
-- s       : a given sequence
-- returns : the sum of the largest subsequence found
-- returns : the starting index of the largest subsequence found
-- returns : the final index of the largest subsequence found
local function gss_brute_force(s)
  local st, ed = 1
  local sum , max = s[st], s[st]
  for i = 1, #s do
    for j = i, #s do
      sum = 0
      for k = i, j do sum = sum + s[k] end
      if sum > max then
        st, ed = i, j
        max = sum
      end
    end
  end
  return max, st, ed==nil and st or ed
end

-- Computes the largest sub-sequential sum by computing sub-sums
-- s       : a given sequence
-- returns : the sum of the largest subsequence found
-- returns : the starting index of the largest subsequence found
-- returns : the final index of the largest subsequence found
local function gss_subsums(s)
  local st, ed = 1
  local sum , max = s[st], s[st]
  for i = 1, #s do
    sum = 0
    for j = i, #s do
      sum = sum + s[j]
      if sum > max then
        st, ed = i, j
        max = sum
      end
    end
  end
  return max, st, ed==nil and st or ed
end

-- Computes the largest sub-sequential sum with dynamic programming
-- s       : a given sequence
-- returns : the sum of the largest subsequence found
-- returns : the starting index of the largest subsequence found
-- returns : the final index of the largest subsequence found
local function gss_dynamic(a)
  local s, t = {}, {}
  s[1], t[1] = a[1], 1
  local max = s[1]
  local st, ed = 1, 1
  for i = 2, #a do
    if s[i-1] > 0 then
      s[i] = s[i-1] + a[i]
      t[i] = t[i-1]
    else
      s[i] = a[i]
      t[i] = i
    end
    if s[i] > max then
      st, ed = t[i], i
      max = s[i]
    end
  end
  return max, st, ed
end

return {
  kadanes     = kadanes,
  brute_force = gss_brute_force,
  subsums     = gss_subsums,
  dynamic     = gss_dynamic,
}
