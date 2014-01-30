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
-- items   : an array of items  (see note before). This array will be
-- sorted regarding their benefits in decreasing order.
-- capacity: the maximum capacity of the knapsack
-- returns : 1. an array of items
--           2. the maximum profit
local function fractionalKnapsack(items, capacity)
  table.sort(items, function(a, b) return a.b > b.b end)
  local inKnapsack, profit = {}, 0
  while capacity > 0 do
    local max_item = pop(items)
    max_item.p = max_item.w > capacity and capacity/max_item.w or 1
    max_item.b = max_item.p * max_item.b
    max_item.w = max_item.p * max_item.w
    capacity = capacity - max_item.w
    table.insert(inKnapsack, max_item)
    profit = profit + max_item.b
  end
  return inKnapsack, profit
end


-- Performs standard 0/1 Knapsack, meaning that an item is either
-- picked or not. This implementation uses dynamic programming.
-- items   : an array of items (see note before).
-- capacity: the maximum capacity of the knapsack
-- returns : 1. an array of items
--           2. the maximum profit
local function integerKnapsack(items, capacity)
  -- Get the count of items
  local numOfItems = #items

  -- Auxiliary tables for dynamic search and selected items tracking
  local V, K = {}, {}

  -- Inits auxiliary tables with 0's. Note that although
  -- Lua's arrays start at 1, we start looping at 0
  for i = 0, numOfItems do
    V[i], K[i] = {}, {}
    for w = 0, capacity do
      V[i][w], K[i][w] = 0, 0
    end
  end

  -- Dynamic search
  for i = 1, numOfItems do
    local item = items[i]
    for w = 0, capacity do
      if item.w < w
        and (item.b + V[i - 1][w - item.w] > V[i - 1][w]) then
          V[i][w] = item.b + V[i-1][w - item.w]
          K[i][w] = 1
      else
        V[i][w] = V[i - 1][w]
        K[i][w] = 0
      end
    end
  end

  -- Process auxiliary tables to identify
  -- selected items and evaluate the profit
  local inKnapsack, profit = {}, 0
  for i = numOfItems, 1, -1 do
    local item = items[i]
    if K[i][capacity] == 1 then
      table.insert(inKnapsack, item)
      capacity = capacity - item.w
      profit = profit + item.b
    end
  end

  return inKnapsack, profit
end

return {
  fractional = fractionalKnapsack,
  integer    = integerKnapsack
}

