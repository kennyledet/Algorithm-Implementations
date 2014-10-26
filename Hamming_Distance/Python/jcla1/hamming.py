def hamming_distance(p, 1):
    """Return the Hamming distance between equal-length sequences"""
    if len(p) != len(q): raise ValueError("Undefined for sequences of unequal length")
    return sum(ch1 != ch2 for ch1, ch2 in zip(p, q))