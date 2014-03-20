-- Negamax search implementation
-- See: http://en.wikipedia.org/wiki/Negamax

-- Internal recursive Minimax search
local function negamax(tree, node, depth, flag)
  if depth == 0 or tree:isLeaf(node) then
    return tree:heuristic(node) * flag
  end
  local children = tree:children(node)
  local bestScore = -math.huge
  for i, child in ipairs(children) do
    bestScore = math.max(bestScore, -negamax(tree, child, depth - 1, -flag))
  end
  return bestScore
end

-- Performs Negamax search
-- node  : the node from where to start the search, usually the head node
-- tree  : the search tree
-- depth : the maximum depth of search
-- flag  : the player (+1) or the opponent (-1)
return function(node, tree, depth, flag)
  flag = (flag / math.abs(flag)) -- Gets the sign (either +1 or -1)
  return negamax(tree, node, depth, flag)
end


