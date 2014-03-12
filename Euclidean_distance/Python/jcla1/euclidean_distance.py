from math import sqrt

# This is the functional version of the algorithm
# It uses a Python generator expression to get rid
# of the loop, which you can find in the procedural
# version down below.
def euclidean_distance(q, p):
    # Make sure both vectors are in the same dimension
    assert len(q) == len(p)
    return sqrt(sum([(u-v)**2 for u, v in zip(q, p)]))

def euclidean_distance_procedural(q, p):
    # Make sure both vectors are in the same dimension
    assert len(q) == len(p)

    s = 0
    for u, v in zip(q, p):
        s += (u-v)**2

    return sqrt(s)

if __name__ == '__main__':
    print euclidean_distance([1, 2, 3], [4, 5, 6])