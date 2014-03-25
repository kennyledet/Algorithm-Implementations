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

-- Prints he bottles of beer song
-- nbootles : the number of bottles of beer
local function print_bottles(nbottles)
  for i = nbottles, 1, -1 do
    io.write(('%s on the wall, %s.\n'):format(caps(bottles(i)), bottles(i)))
    io.write(('Take one down and pass it around, %s on the wall.\n\n'):format(bottles(i-1)))
  end
  io.write(('%s on the wall, %s.\n'):format(caps(bottles(0)), bottles(0)))
  io.write(('Go to the store and buy some more, %d bottles of beer on the wall.'):format(nbottles-1))
end

return print_bottles
