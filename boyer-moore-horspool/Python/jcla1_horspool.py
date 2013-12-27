def horspool(haystack, needle):
    if len(needle) < 1:
        return -1

    bad_match_table = dict()
    max_offset = len(haystack) - len(needle)
    last_index = len(needle) - 1
    offset = 0

    for index, letter in enumerate(needle):
        bad_match_table[letter] = last_index - index

    while offset <= max_offset:
        scan = last_index
        while needle[scan] == haystack[scan+offset]:
            if scan == 0:
                return offset
            scan -= 1

        offset += (bad_match_table.get(haystack[offset + last_index]) or (last_index + 1))

    return -1

if __name__ == '__main__':
    assert 18 == horspool("Because sometimes algorithms are more fun than str.index()", "algorithms")