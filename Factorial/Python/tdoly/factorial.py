#!/usr/bin/env python
# -*- coding: utf-8 -*-

'''
File: factorial.py
Author: tdoly
Description: http://en.wikipedia.org/wiki/Factorial
'''

def factorial(num):
    if num < 0:
         raise "the input number is error"
    elif num == 0:
        return 1
    else:
        return reduce((lambda x, y: x*y), [i for i in range(num+1) if i > 0])

