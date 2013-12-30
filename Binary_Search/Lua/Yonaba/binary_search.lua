-- A binary search function implementation
local function bisect(t,v,comp,s,e)
	s, e = s or 1, e or #t
	if not s or e < s then return end
	len = s - e + 1
	local h = math.floor((s + e) / 2)
	if t[h] == v then return h end
	if not comp(t[h],v) then
		return bisect(t, v, comp, s, h - 1)
	else
		return bisect(t, v, comp, h + 1, e)
	end
end

-- Usage: f(tbl, value [,comp])
-- tbl: the table where to search, must be sorted
-- value: the value to be searched
-- comp (optional): a comparison function,
--  		 defaults to function(a,b) return a<b end
-- returns: the key if value was found, or nil
return function (tbl, value, comp)
	comp = comp or function(a,b) return a < b end
	return bisect(tbl, value, comp)
end