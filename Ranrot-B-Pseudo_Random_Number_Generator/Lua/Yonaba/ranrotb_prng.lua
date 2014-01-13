-- RANROT /B PRNG Implementation

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

-- Note: Lua does not have integer type, so `int a = b + c`
--   translates as `a = (b + c) % 2^32`
--   Thanks to Robin Wellner enlighting me on this:
-- See: http://love2d.org/forums/viewtopic.php?f=3&t=76909#p160267
 
local LIMIT = 2^32
return function (seed)
	seed = seed or os.time()
	local lo, hi = seed, bit.bnot(seed)
	return function()
		hi = bit.lshift(hi,16) + bit.rshift(hi, 16)
		hi = (hi + lo) % LIMIT
		lo = (lo + hi) % LIMIT
		return hi
	end
end

