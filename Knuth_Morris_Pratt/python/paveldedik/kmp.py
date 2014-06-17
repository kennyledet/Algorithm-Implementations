def prefix(p):
    """Prepares prefix function:

        r[q] = max{k | k < q and p[0..k] is suffix of p[0..q]}
    """
    r = [0] * len(p)
    k = 0
    for q in range(1, len(p)):
        while k > 0 and p[k] != p[q]:
            k = r[k-1]
        if p[k] == p[q]:
            k += 1
        r[q] = k
    return r


def kmp(t, p):
    """Implementation of the Knuth-Morris-Pratt algorithm."""
    r = prefix(p)
    q = 0
    for i in range(len(t)):
        while q > 0 and p[q] != t[i]:
            q = r[q-1]
        if p[q] == t[i]:
            q += 1
        if q == len(p):
            yield i - len(p) + 1
            q = r[q-1]


if __name__ == '__main__':
    for pos in kmp('krokrokroky krokroky', 'kroky'):
        print pos
