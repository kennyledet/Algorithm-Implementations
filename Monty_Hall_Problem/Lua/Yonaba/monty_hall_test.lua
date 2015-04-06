-- Tests for monty_hall.lua
local monty_hall = require 'monty_hall'

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

-- Seeding
math.randomseed(os.time())

-- Simulates n trials
local function simulate(f, trials, switch)
  local won = 0
  for i = 1, trials do
    local test = f(math.random(1e3), switch)
    won = won + (test and 1 or 0)
  end
  print(('Won : %3d/%03d - Success rate: %.2f%%'):format(won, trials, (won * 100 / trials)))
  return (won * 100 / trials)
end

run('Monty-Hall test', function()

  print('Simulates n times with a random number of doors without switching')
  local min_success_rate = 0
  for i = 100, 500, 100 do
    local success_rate = simulate(monty_hall, i)
    if success_rate > min_success_rate then
      min_success_rate = success_rate
    end
  end

  print('\nSimulates n times with a random number of doors with switching')
  local max_success_rate = 100
  for i = 100, 500, 100 do
    local success_rate = simulate(monty_hall, i, true)
    if success_rate < max_success_rate then
      max_success_rate = success_rate
    end
  end

  assert(min_success_rate < max_success_rate)
  print()

end)

print(('-'):rep(80))
print(('Total : %02d: Pass: %02d - Failed : %02d - Success: %.2f %%')
  :format(total, pass, total-pass, (pass*100/total)))
