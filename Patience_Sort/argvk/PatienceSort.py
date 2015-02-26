piles = []

def __add_to_pile__(x):
    for key, pile in enumerate(piles):
        if pile[0] >= x:
            piles[key].insert(0,x)
            return
    piles.append([x])

def __reorder_pile__(small_pile):
    for key, pile in enumerate(piles):
        if pile[0] >= small_pile[0]:
            piles.insert(key,small_pile)
            return
    piles.append(small_pile)

def patience_sort(seq):
    for x in seq:
        __add_to_pile__(x)

    for i in xrange(len(seq)):
        small_pile = piles.pop(0)
        seq[i] = small_pile.pop(0)
        if small_pile:
            __reorder_pile__(small_pile)
    assert not piles
