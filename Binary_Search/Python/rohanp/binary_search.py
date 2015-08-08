#!/usr/bin/env python3
""" Binary Search """
__author__ = "Rohan Pandit"

def binary_search(lst, el):
    #returns index of element, or -1 if not in lst
    return binary_search_recur(lst, el, len(lst)//2)

def binary_search_recur(lst, el, max_idx):
    if lst[ max_idx ] < el:
        return binary_search_recur(lst, el, max_idx + max_idx//2 )
    elif el < lst[ max_idx ]:
        return binary_search_recur(lst, el, max_idx//2)
    else:
        return max_idx
