-- Lyrics for the song "The Twelve Days Of Xmas"
-- See here: http://www.lyricsmode.com/lyrics/c/christmas_carols/the_twelve_days_of_christmas.html

-- The days
local days = {
  'first', 'second', 'third', 'fourth', 'fifth', 'sixth',
  'seventh', 'eighth', 'nineth', 'tenth', 'eleventh', 'twelfth'
}

-- The gifts my true love gave to me
local gifts = {
  "A partridge in a pear tree.",
  "Two turtle doves",
  "Three french hens",
  "Four calling birds",
  "Five golden rings",
  "Six geese a-laying",
  "Seven swans a-swimming",
  "Eight maids a-milking",
  "Nine ladies dancing",
  "Ten lords a-leaping",
  "Eleven pipers piping",
  "Twelve drummers drumming",
}

-- day: (optional) the number of the day at which the song will start. Defaults to 1
-- returns : the lyrics of the song, as a string
local function the_12_days_of_xmas(day)
  day = day or 1
  assert(day >= 1 and day <= 12, 'day number has to be within the [1..12] range')
  local lyrics = {}
  
  for i = day, 12 do
    table.insert(lyrics, ('On the %s day of Christmas '):format(days[i]))
    table.insert(lyrics, 'My true love gave to me:')
    for j = i, 1, -1 do
      table.insert(lyrics, gifts[j])      
    end
    table.insert(lyrics, '')
  end
  return table.concat(lyrics, '\n')
  
end

return the_12_days_of_xmas
