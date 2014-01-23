-- Weighted/Biased random distribution implementation
-- See : http://codetheory.in/weighted-biased-random-number-generation-with-javascript-based-on-probability/

-- Note: The sum of weights should be 1. That is, all
--  weights are decimal values lower than 1.

-- Note: As all the implementations given below uses
--  math.random, one can call math.randomseed with a
--  custom seed before using them.

-- items   : an array-list of values
-- weights : a map table holding the weight for each value in
--  in the `items` list.
-- returns : an iterator function
local function expanding_random(items, weights)
  local list = {}
  for _, item in ipairs(items) do
    local n = weights[item] * 100
    for i = 1, n do table.insert(list, item) end
  end
  return function()
    return list[math.random(1, #list)]
  end
end

-- items   : an array-list of values
-- weights : a map table holding the weight for each value in
--  in the `items` list.
-- returns : an iterator function
local function in_place_random(items, weights)
  local partial_sums, partial_sum = {}, 0
  for _, item in ipairs(items) do
    partial_sum = partial_sum + weights[item]
    table.insert(partial_sums, partial_sum)
  end
  return function()
    local n, s = math.random(), 0
    for i, si in ipairs(partial_sums) do
      s = s + si
      if si > n then return items[i] end
    end
  end
end

return {
  expanding = expanding_random,
  in_place  = in_place_random
}
