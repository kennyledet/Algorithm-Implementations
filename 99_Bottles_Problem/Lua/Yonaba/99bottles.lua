-- 99 bottles of beer implementation
-- See : http://99-bottles-of-beer.net/lyrics.html

-- Pluralization
local function bottles(count)
  local pref = (count > 1 and ' bottles ')
             or count == 1 and ' bottle '
             or 'no more bottle '
  return (count == 0 and '' or count) .. pref .. 'of beer'
end

-- Capitalizes the first char of a string
local function caps(str) return str:gsub('^%l',string.upper) end

-- Returns the bottles of beer song
-- nbottles : the number of bottles of beer
-- returns : the lyrics as a string
local function print_bottles(nbottles)
  local lyrics = {}
  for i = nbottles, 1, -1 do
    table.insert(lyrics,('%s on the wall, %s.'):format(caps(bottles(i)), bottles(i)))
    table.insert(lyrics,('Take one down and pass it around, %s on the wall.\n'):format(bottles(i-1)))
  end
  table.insert(lyrics,('%s on the wall, %s.'):format(caps(bottles(0)), bottles(0)))
  table.insert(lyrics,('Go to the store and buy some more, %d bottles of beer on the wall.'):format(nbottles-1))
  return table.concat(lyrics, '\n')
end

return print_bottles
