-- Tests for monty_hall.lua
local monty_hall = require 'monty_hall'

local total, pass = 0, 0

local function dec(str, len)
  return #str < len
     and str .. (('.'):rep(len-#str))
      or str:sub(1,len)
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
end

print('Simulate Monty-Hall with 100 doors without switching')
simulate(monty_hall, 100)
simulate(monty_hall, 250)
simulate(monty_hall, 500)


print('\nSimulate Monty-Hall with 100 doors with switching')
simulate(monty_hall, 100, true)
simulate(monty_hall, 250, true)
simulate(monty_hall, 500, true)


print(('-'):rep(80))
print(('Total : %02d: Pass: %02d - Failed : %02d - Success: %.2f %%')
  :format(total, pass, total-pass, (pass*100/total)))
