-- Bresenham line marching algorithm implementation
-- See: http://www.cs.helsinki.fi/group/goa/mallinnus/lines/bresenh.html

-- x0: the x-coordinate of the start point
-- y0: the y-coordinate of the end point
-- x1: the x-coordinate of the start point
-- y1: the y-coordinate of the end point
-- returns: an array of {x = x, y = y} pairs
return function(x0, y0, x1, y1)
  local points = {}
  local dx, dy = math.abs(x1-x0), math.abs(y1-y0)
  local err = dx - dy
  local sx, sy= (x0 < x1) and 1 or -1, (y0 < y1) and 1 or -1

  while true do
    points[#points + 1] = {x = x0, y = y0}
    if x0 == x1 and y0 == y1 then break end
    local e2 = 2 * err
    if e2 > -dy then
      err = err - dy
      x0 = x0 + sx
    end
    if e2 < dx then
      err = err + dx
      y0 = y0 + sy
    end
  end
  return points
end
