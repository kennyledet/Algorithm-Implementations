-- Towers of Hanoi problem solver implementation
-- See: http://en.wikipedia.org/wiki/Tower_of_Hanoi

-- Moves n disks from S to D via V
-- n : The number of disks to move
-- S: the source tower
-- D : the destination tower
-- V : a temporary tower
-- log : (optional) a table to save the procedure trace
local function move (n, S, D, V, log)
  if n > 0 then
    move(n - 1, S, V, D, log)
    if log then table.insert(log, ('%s->%s'):format(S, D)) end
    move(n - 1, V, D, S, log)
  end
end

return move