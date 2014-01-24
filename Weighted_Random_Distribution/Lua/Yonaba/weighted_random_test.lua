-- Tests for weighted_random.lua
local rand = require 'weighted_random'

-- Generates n random values
local function gen(f, items, weights, n)
  local rnd = f(items, weights)
  local t = {}
  for i = 1, n do
    local val = rnd()
    t[val] = (t[val] or 0) + 1
  end
  for k,v in pairs(t) do
    print((' >> %s : %d (%.2f %%)'):format(k, v, 100*v/n))
  end
end

print(('-'):rep(80))
local items = {'a', 'b', 'c', 'd', 'e'}
local weights = {a = 0.1, b = 0.2, c = 0.3, d = 0.2, e = 0.2}
print('In-place random distribution')
gen(rand.in_place, items, weights, 1e6)
print('\nExpanding random distribution')
gen(rand.expanding, items, weights, 1e6)
print(('-'):rep(80))
