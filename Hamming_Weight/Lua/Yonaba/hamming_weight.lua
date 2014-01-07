-- Hamming weight implementation
-- See: http://en.wikipedia.org/wiki/Hamming_weight

-- Assertion test for the bitwise implementation being used
local function checkBitImplementation(bit)
	local msg = 'Failed testing bitwise implementation'
  assert(bit.bnot          ~= nil,        msg)
  assert(bit.lshift        ~= nil,        msg)
  assert(bit.rshift        ~= nil,        msg)
	assert(bit.bnot(0)       == 4294967295, msg)
	assert(bit.lshift(2, 16) == 131072,     msg)
	assert(bit.rshift(2, 16) == 0,          msg)
	return bit
end

-- Note: Lua versions prior to 5.2 does not have native
--   bitwise ops support. This implementation is shipped
--   with David Manura's bitwise op library [1]. The
--   following code will try to check the version of Lua.
--   If being 5.2, it will fallback to its native bit32 library.
--   If we are on LuaJit, it will default to its bitOp, otherwise
--   it will use 'numberlua' for bitwise support.
local bit = checkBitImplementation(
   _VERSION:match('5.2') and bit32
	       or (jit ~= nil) and bit
	       or require 'numberlua'
)

-- Hamming weight evaluation function
--       i: integer value
-- returns: the hamming weight of the given input
return function (i)
  i = i - (bit.band(bit.rshift(i,1), 0x55555555))
  i = bit.band(i, 0x33333333) + bit.band(bit.rshift(i,2), 0x33333333)
  return bit.rshift((bit.band((i + bit.rshift(i,4)), 0x0F0F0F0F) * 0x01010101), 24)
end
