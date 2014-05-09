-- Self-Descriptive Number
-- See: http://en.wikipedia.org/wiki/Self-descriptive_number

-- Checks if the given number is self-descriptive
-- n       :  a number, in base 10
-- returns : true if the number is self-descriptive, false otherwise
return function (n)
  local str_num = tostring(n)
  local digits = {}
  for i = 0, 9 do digits[i] = 0 end
  
  -- Counts the occurences for each digits in the string 
  for d in str_num:gmatch('%d') do
  local num_d = tonumber(d)  
    digits[num_d] = digits[num_d] + 1
  end
  
  -- Checks if each digit position matches the count for this digit
  -- Use i-1 since Lua's string indices start at 1
  for i = 1, #str_num do
    if tonumber(str_num:sub(i,i)) ~= digits[i-1] then return false end
  end
  
  return true
end