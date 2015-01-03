#!/usr/bin/ruby

def print_hallway(doors)
  doors.each_with_index { |status, i| puts "Door \##{i+1}: Open" if status == 1 }
  doors.each_with_index { |status, i| puts "Door \##{i+1}: Closed" if status == 0 }
end

# Each pass start at the nth door, open/close it
# then step n more doors away and repeat
def walk_hallway(doors, passes)
  passes.times do |n|
    (n..passes).step(n+1) { |i| doors[i] ^= 1 }
  end
end

MAX_DOORS = 100
MAX_PASSES = 100

doors = [0]*MAX_DOORS
walk_hallway(doors, MAX_PASSES)
print_hallway(doors)
