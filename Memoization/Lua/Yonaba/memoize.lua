-- Memoization function implementation
-- See: http://en.wikipedia.org/wiki/Memoization
-- Adapted from: https://github.com/Yonaba/Moses/blob/master/moses.lua#L982

-- An identity function, returns the given input
local function identity(value) return value end

-- Returns a memoization capable version of a given function.
-- f       : a function to be memoized
-- hash    : an optional hash function. Defaults to an identity function (f(v) return v end)
-- returns : a new function
return function (f, hash)
  local _cache = setmetatable({},{__mode = 'kv'})
  local _hasher = hash or identity
  return function (...)
      local _hashKey = _hasher(...)
      local _result = _cache[_hashKey]
      if not _result then _cache[_hashKey] = f(...) end
      return _cache[_hashKey]
    end
end

