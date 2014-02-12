-- Convex hull algorithms implementation
-- See : http://en.wikipedia.org/wiki/Convex_hull

-- Calculates the signed area
local function signedArea(p, q, r)
  local cross = (q.y - p.y) * (r.x - q.x)
              - (q.x - p.x) * (r.y - q.y)
  return cross
end

-- Checks if points p, q, r are oriented counter-clockwise
local function isCCW(p, q, r) return signedArea(p, q, r) < 0 end

-- Returns the convex hull using Jarvis' Gift wrapping algorithm).
-- It expects an array of points as input. Each point is defined
-- as : {x = <value>, y = <value>}.
-- See : http://en.wikipedia.org/wiki/Gift_wrapping_algorithm
-- points  : an array of points
-- returns : the convex hull as an array of points
local function jarvis_march(points)
  -- We need at least 3 points
  local numPoints = #points
  if numPoints < 3 then return end

  -- Find the left-most point
  local leftMostPointIndex = 1
  for i = 1, numPoints do
    if points[i].x < points[leftMostPointIndex].x then
      leftMostPointIndex = i
    end
  end

  local p = leftMostPointIndex
  local hull = {} -- The convex hull to be returned

  -- Process CCW from the left-most point to the start point
  repeat
    -- Find the next point q such that (p, i, q) is CCW for all i
    q = points[p + 1] and p + 1 or 1
    for i = 1, numPoints, 1 do
      if isCCW(points[p], points[i], points[q]) then q = i end
    end

    table.insert(hull, points[q]) -- Save q to the hull
    p = q  -- p is now q for the next iteration
  until (p == leftMostPointIndex)

  return hull
end

return {
  jarvis = jarvis_march
}
