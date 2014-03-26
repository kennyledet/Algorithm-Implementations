-- Monty-Hall problem implementation
-- See : http://en.wikipedia.org/wiki/Monty_Hall_problem

-- Create a range of values as a list
local function range(n)
  local t = {}
  for i = 1,n do t[i] = i end
  return t
end

-- Simulates Monty Hall problem
-- ndoors : number of doors
-- switch : whether or not the player wants to switch his initial choice
-- return : true if the player won, false otherwise
local function simulate(ndoors, switch)
  local winning_door = math.random(1,ndoors)
  local choice       = math.random(1,ndoors)
  local doors = range(ndoors)
  while #doors>2 do
    local door_to_open_index = math.random(1,#doors)
    local door_to_open = doors[door_to_open_index]
    if (door_to_open ~= winning_door
      and door_to_open ~= choice) then
        table.remove(doors, door_to_open_index)
    end
  end

  if switch then
    choice = (doors[1] == choice and doors[2] or doors[1])
  end
  return (choice == winning_door)
end

math.randomseed(os.time())
local r = simulate(5,true)
print('won',r)

return simulate
