-- Knapsack problem algorithm implementation
-- See: http://en.wikipedia.org/wiki/Knapsack_problem

-- Pops value at the head of an array
local function pop(s)
  local head = s[1]
  table.remove(s, 1)
  return head
end

-- Note: the items to be passed should be represented this way
-- items = {
--   {name = 'item_name', w = <item_weight>, b = <benefit>},
--   {name = 'item_name', w = <item_weight>, b = <benefit>},
--   ...
-- }
-- In the returned output, each item will receive a new attribute 'p'
-- referring to how much (percentage) of the item has been added into 
-- the knapsack.

-- Performs fractional Knapsack. Fractional here means we can
-- select a portion of a item. With that respect, this implementation
-- is greedy.
-- items   : an array of items (this array will be sorted regarding
--           their benefits in decreasing order)
-- capacity: the maximum capacity of the knapsack
-- returns : an array of items
local function fractionalKnapsack(items, capacity)
  table.sort(items, function(a, b) return a.b > b.b end)
  local inKnapsack = {}
  while capacity > 0 do
    local max_item = pop(items)
    max_item.p = max_item.w > capacity and capacity/max_item.w or 1
    max_item.b = max_item.p * max_item.b
    max_item.w = max_item.p * max_item.w
    capacity = capacity - max_item.w
    table.insert(inKnapsack, max_item)
  end
  return inKnapsack
end

return {
  fractional = fractionalKnapsack,
}


