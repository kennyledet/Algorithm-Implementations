-- 100 doors problem implementation
-- See : http://rosettacode.org/wiki/100_doors

-- Collects keys of values matching a predicate
local function collect(t, v)
  local s = {}
  for k,_v in ipairs(t) do
    if _v == v then s[#s+1] = k end
  end
  return s
end

-- Simulates the 100 doors problem
-- returns : a table of all open doors
--           a table of all closed doors
local function hundred_doors()
  local doors = {}
  for mp = 1, 100 do
    for i = mp, 100, mp  do
      doors[i] = (doors[i] == nil and false or not doors[i])
    end
  end
  return collect(doors, true), collect(doors, false)
end

return hundred_doors
