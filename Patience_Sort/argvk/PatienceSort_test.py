from PatienceSort import patience_sort

foo = [4, 65, 2, 4, -31, 0, 99, 1, 83, 782, 1]
fin_foo = [-31, 0, 1, 1, 2, 4, 4, 65, 83, 99, 782]
patience_sort(foo)

assert(foo == fin_foo)
