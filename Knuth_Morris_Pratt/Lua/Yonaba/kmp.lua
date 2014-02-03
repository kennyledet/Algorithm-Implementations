-- Knuth-Morris-Pratt string searching algorithm implementation
-- See: http://en.wikipedia.org/wiki/Knuth%E2%80%93Morris%E2%80%93Pratt_algorithm

local function kmp_table(pattern)
  local result = {}
  for i = 1, #pattern+1,1 do
    local j = i
    while true do
      if j == 1 then
        result[#result + 1] = 1
        break
      end
      j = j-1
      if pattern:sub(result[j], result[j]) == pattern:sub(i, i) then
        result[#result + 1] = result[j] + 1
        break
      end
      j = result[j]
    end
  end
  return result
end

-- Knuth-Morris-Pratt string searching function
-- needle   : the pattern to search
-- haystack : the string in which the pattern will be searched
-- returns  : the position of the match, otherwise nil
return function(needle, haystack)
  local fail = kmp_table(needle)
  local index, match = 0,1
  while index + match < #haystack do
   if haystack:sub(index + match, index + match) == needle:sub(match, match) then
      match = match + 1
      if match-1 == #needle then
        return index
      end
    else
      if match == 1 then index = index + 1
      else
        index = index + match - (fail[match-1])
        match = fail[match-1]
      end
    end
  end
end
