-- Tests for the12daysofxmas.lua
local the12daysofxmas = require 'the12daysofxmas'

local total, pass = 1, 1

local function dec(str, len)
  return #str < len
     and str .. (('.'):rep(len-#str))
      or str:sub(1,len)
end

print('Lyrics from the start:\n')
local lyrics = the12daysofxmas()
print(lyrics)
print(('-'):rep(80))

print('Lyrics from the nineth verse:\n ')
lyrics = the12daysofxmas(9)
print(lyrics)

print('\n'..('-'):rep(80))
print(('Total : %02d: Pass: %02d - Failed : %02d - Success: %.2f %%')
  :format(total, pass, total-pass, (pass*100/total)))
