-- Bresenham-based Supercover line marching algorithm
-- See: http://lifc.univ-fcomte.fr/home/~ededu/projects/bresenham/

-- Note: This algorithm is based on Bresenham's line marching, but
--  instead of considering one step per axis, it covers all the points
--  the ideal line covers. It may be useful for example when you have 
--  to know if an obstacle exists between two points (in which case the 
--  points do not see each other)

-- x1: the x-coordinate of the start point
-- y1: the y-coordinate of the end point
-- x2: the x-coordinate of the start point
-- y2: the y-coordinate of the end point
-- returns: an array of {x = x, y = y} pairs
return function (x1, y1, x2, y2)
  local points = {}
  local xstep, ystep, err, errprev, ddx, ddy
  local x, y = x1, y1
  local dx, dy = x2 - x1, y2 - y1

  points[#points + 1] = {x = x1, y = y1}

  if dy < 0 then
    ystep = ystep - 1
    dy = -dy
  else
    ystep = 1
  end

  if dx < 0 then
    xstep = xstep - 1
    dx = -dx
  else
    xstep = 1
  end

  ddx, ddy = dx * 2, dy * 2

  if ddx >= ddy then
    errprev, err = dx, dx
    for i = 1, dx do
      x = x + xstep
      err = err + ddy
      if err > ddx then
        y = y + ystep
        err = err - ddx
        if err + errprev < ddx then
          points[#points + 1] = {x = x, y = y - ystep}
        elseif err + errprev > ddx then
          points[#points + 1] = {x = x - xstep, y = y}
        else
          points[#points + 1] = {x = x, y = y - ystep}
          points[#points + 1] = {x = x - xstep, y = y}
        end
      end
      points[#points + 1] = {x = x, y = y}
      errprev = err
    end
  else
    errprev, err = dy, dy
    for i = 1, dy do
      y = y + ystep
      err = err + ddx
      if err > ddy then
        x = x + xstep
        err = err - ddy
        if err + errprev < ddy then
          points[#points + 1] = {x = x - xstep, y = y}
        elseif err + errprev > ddy then
          points[#points + 1] = {x = x, y = y - ystep}
        else
          points[#points + 1] = {x = x, y = y - ystep}
          points[#points + 1] = {x = x - xstep, y = y}
        end
      end
      points[#points + 1] = {x = x, y = y}
      errprev = err
    end
  end
  return points
end
