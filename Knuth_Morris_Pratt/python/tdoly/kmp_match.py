#!/usr/bin/env python
# -*- coding: utf-8 -*-

'''
File: kmp_match.py
Author: 
Description: http://en.wikipedia.org/wiki/Knuth%E2%80%93Morris%E2%80%93Pratt_algorithm and the Author: Keith Schwarz (htiek@cs.stanford.edu)
'''


def failTable(pattern):
    '''Create the resulting table, which for length zero is None.
    Usage:
    >>>failTable('ABCDABD')
    [None, 0, 0, 0, 0, 1, 2, 0]
    >>>failTable('py py py python py')
    [None, 0, 0, 0, 1, 2, 3, 4, 5, 6, 7, 8, 0, 0, 0, 0, 0, 1, 2]
    '''
    result=[None]

    # Iterate across the rest of the characters, filling in the values for the
    # rest of the table.
    for i in range(len(pattern)):
        j = i

        while True:
            # If j hits zero, the recursion says that the resulting value is
            # zero since we're looking for the LPB of a single-character
            # string.
            if j == 0:
                result.append(0)
                break

            # Otherwise, if the character one step after the LPB matches the
            # next character in the sequence, then we can extend the LPB by one
            # character to get an LPB for the whole sequence.
            if pattern[result[j]] == pattern[i]:
                result.append(result[j] + 1)
                break

            # Finally, if neither of these hold, then we need to reduce the
            # subproblem to the LPB of the LPB.
            j = result[j]

    return result

def kmpMatch(needle, haystack):
    fail = failTable(needle)

    # Keep track of the start index and next match position, both of which
    # start at zero since our candidate match is at the beginning and is trying
    # to match the first character.
    index = 0
    match = 0

    while index + match < len(haystack):

        # If the current character matches the expected character, then bump up
        # the match index.
        if haystack[index + match] == needle[match]:
            match = match + 1

            # If we completely matched everything, we're done.
            if match == len(needle):
                return index

        # Otherwise, we need to look at the fail table to determine what to do
        # next.
        else:

            # If we couldn't match the first character, then just advance the
            # start index.  We need to try again.
            if match == 0:
                index = index + 1

            # Otherwise, see how much we need to skip forward before we have
            # another feasible match.
            else:
                index = index + match - fail[match]
                match = fail[match]

    # if no match,return None
    return None


if __name__ == '__main__':

   print kmpMatch('ABCDABD', 'ABC ABCDAB ABCDABCDABDE') # 15
   print kmpMatch('0101', '0011001011') # 5
   print kmpMatch('py py py python py', 'apyapy py py python pys') # 4
