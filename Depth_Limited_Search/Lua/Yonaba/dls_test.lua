-- Tests for dls.lua
local DLS = require 'dls'

local total, pass = 0, 0

local function dec(str, len)
  return #str < len
     and str .. (('.'):rep(len-#str))
      or str:sub(1,len)
end

local function same(t, p, comp)
  for k,v in ipairs(t) do
    if not comp(v, p[k]) then return false end
  end
  return true
end

local function run(message, f)
  total = total + 1
  local ok, err = pcall(f)
  if ok then pass = pass + 1 end
  local status = ok and 'PASSED' or 'FAILED'
  print(('%02d. %68s: %s'):format(total, dec(message,68), status))
end

run('Testing linear graph', function()
  local comp = function(a, b) return a.value == b end
  local ln_handler = require 'handlers.linear_handler'
  ln_handler.init(-2,5)
  local dls = DLS(ln_handler)

  local start, goal = ln_handler.getNode(0), ln_handler.getNode(5)
  assert(same(dls:findPath(start, goal, 8),  {0,1,2,3,4,5}, comp))
  dls:resetForNextSearch()

  assert(not dls:findPath(start, goal, 4))
  dls:resetForNextSearch()

  start, goal = ln_handler.getNode(-2), ln_handler.getNode(5)
  assert(same(dls:findPath(start, goal, 8),  {-2,-1,0,1,2,3,4,5}, comp))

  dls:resetForNextSearch()
  assert(not dls:findPath(start, goal, 6))
end)

run('Testing grid graph', function()
  local comp = function(a, b) return a.x == b[1] and a.y == b[2] end
  local gm_handler = require 'handlers.gridmap_handler'
  local dls = DLS(gm_handler)
  local map = {{0,0,0,0,0},{0,1,1,1,1},{0,0,0,0,0}}
  gm_handler.init(map)

  local start, goal = gm_handler.getNode(1,1), gm_handler.getNode(5,3)
  assert(same(dls:findPath(start, goal, 15), {{1,1},{1,2},{1,3},{2,3},{3,3},{4,3},{5,3}}, comp))

  dls:resetForNextSearch()
  assert(not dls:findPath(start, goal, 5))
end)

run('Testing point graph', function()
  local comp = function(a, b) return a.x == b[1] and a.y == b[2] end
  local pg_handler = require 'handlers.point_graph_handler'
  local dls = DLS(pg_handler)

  pg_handler.addNode('a')
  pg_handler.addNode('b')
  pg_handler.addNode('c')
  pg_handler.addNode('d')
  pg_handler.addEdge('a', 'b')
  pg_handler.addEdge('a', 'c')
  pg_handler.addEdge('b', 'd')

  local comp = function(a, b) return a.name == b end
  local start, goal = pg_handler.getNode('a'), pg_handler.getNode('d')
  assert(same(dls:findPath(start, goal, 3), {'a','b','d'}, comp))

  dls:resetForNextSearch()
  assert(not dls:findPath(start, goal, 1))
end)

print(('-'):rep(80))
print(('Total : %02d: Pass: %02d - Failed : %02d - Success: %.2f %%')
  :format(total, pass, total-pass, (pass*100/total)))
