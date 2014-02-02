-- Tests for warshall.lua
local  w = require 'warshall'

local total, pass = 0, 0

local function dec(str, len)
  return #str < len
     and str .. (('.'):rep(len-#str))
      or str:sub(1,len)
end

local function same(t, d)
  if #t ~= #d then return false end
  if #t[1] ~= #d[1] then return false end
  local n = #t
  for i = 1,n do
    for j = 1, n do
      if t[i][j] ~= d[i][j] then return false end
    end
  end
  return true
end

local function run(message, f)
  total = total + 1
  local ok, err = pcall(f)
  if ok then pass = pass + 1 end
  local status = ok and 'PASSED' or 'FAILED'
  print(('%02d. %68s: %s'):format(total, dec(message,68), status))
end

run('Calculating transitive closure', function()
  local g = w({
    { true, false,  true, false},
    {false, false,  true,  true},
    {false,  true,  true, false},
    { true, false, false, false},
  })

  -- Expects a 4x4 matrix with values filled of "true"
  for i,l in ipairs(g) do
    for k, v in ipairs(l) do assert(v) end
  end

end)

print(('-'):rep(80))
print(('Total : %02d: Pass: %02d - Failed : %02d - Success: %.2f %%')
  :format(total, pass, total-pass, (pass*100/total)))
