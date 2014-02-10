-- Tests for convex_hull.lua
local hull = require 'convex_hull'

local total, pass = 0, 0

local function dec(str, len)
  return #str < len
     and str .. (('.'):rep(len-#str))
      or str:sub(1,len)
end

local function run(message, f)
  total = total + 1
  local ok, err = pcall(f)
  if ok then pass = pass + 1 end
  local status = ok and 'PASSED' or 'FAILED'
  print(('%02d. %68s: %s'):format(total, dec(message,68), status))
end

-- Compare points
local function same(p1,p2)
  return p1.x == p2.x and p1.y == p2.y
end

run('Returns nil when given less than three points', function()
  local points = {{x = 0, y = 3}, {x = 2, y = 2}}
  assert(hull.jarvis(points) == nil)
end)

run('Returns the convex hull', function()
  local points = {
    {x = 0, y = 3},
    {x = 2, y = 2},
    {x = 1, y = 1},
    {x = 2, y = 1},
    {x = 3, y = 0},
    {x = 0, y = 0},
    {x = 3, y = 3}
  }
  local chull = hull.jarvis(points)
  assert(#chull == 4)
  assert(same(chull[1], {x = 0, y = 0}))
  assert(same(chull[2], {x = 3, y = 0}))
  assert(same(chull[3], {x = 3, y = 3}))
  assert(same(chull[4], {x = 0, y = 3}))
end)


print(('-'):rep(80))
print(('Total : %02d: Pass: %02d - Failed : %02d - Success: %.2f %%')
  :format(total, pass, total-pass, (pass*100/total)))
