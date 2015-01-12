#!/usr/bin/ruby

99.downto(1) do |bottles|
  puts "#{bottles} bottles of beer on the wall, #{bottles} bottles of beer."
  puts "Take one down and pass it around, #{(bottles > 1) ? bottles-1 : 'no more'} bottles of beer on the wall."
end

puts "No more bottles of beer on the wall, no more bottles of beer."
puts "Go to the store and buy some more, 99 bottles of beer on the wall."