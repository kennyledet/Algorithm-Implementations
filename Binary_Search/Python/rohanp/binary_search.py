#!/usr/bin/env python3
""" Binary Search """
__author__ = "Rohan Pandit"

def binary_search(lst, el):
	#returns index of element, or -1 if not in lst
	return binary_search_recur(lst, el, 0, len(lst))

def binary_search_recur(lst, el, min_idx, max_idx):
	middle_idx = (max_idx - min_idx) // 2 + min_idx

	if min_idx == max_idx:
		return -1
	elif el == lst[ middle_idx ]:
		return middle_idx
	elif max_idx - min_idx == 1:
		return -1
	elif lst[ middle_idx ] < el:
		return binary_search_recur(lst, el, middle_idx, max_idx)
	else:
		return binary_search_recur(lst, el, min_idx, middle_idx)
