-- Successive Over Relaxation algorithm implementation
-- See : http://en.wikipedia.org/wiki/Successive_over-relaxation

-- Creates a vector of values
local function vector(len, v)
  local x = {}
  for i = 1, len do x[i] = v end
  return x
end

-- Computes the norm of a given vector
local function norm(v)
  local n = 0
  for i, _v in ipairs(v) do
    n = n + (_v * _v)
  end
  return math.sqrt(n)
end

-- Solves the given matrix using SOR algorithm
-- m       : a matrix A in [A]*[x] = [b]
-- b       : the result vector in [A]*[x] = [b]
-- w       : the relaxation parameter, defaults to 1.86
-- eps     : the convergence criterion, defaults to 1e-6
-- maxiter : the maximum number of iterations, defaults to 1e4
-- return  : a solution vector
local function SOR(m, b, w, eps, maxiter)
  local n = #m
  local x = vector(n, 0)
  local q, p, sum
  local t = 0

  w = w or 1.86
  eps = eps or 1e-6
  maxiter = maxiter or 1e4

  repeat
    t = t + 1
    q = norm(x)
    for i =1, n do
      sum = 0
      for j = 1, n do
        if (i ~= j) then
          sum = sum + m[i][j] * x[j]
        end
      end
      x[i] = (1 - w) * x[i] + (w / m[i][i]) * (b[i] - sum)
    end
    p = norm(x)
  until (math.abs(p - q) < eps) or (t >= maxiter)

  return x
end

return SOR