var gnome = require('./gnome_sort')
  , assert = require('assert')
  , actual = [2,3,4,5]
  , expected = gnome([5,3,2,4])

assert.deepEqual(actual, expected, 'gnome([5,3,2,4]) failed')
process.stdout.write('gnome([5,3,2,4]) -> ['+expected+']\n')
