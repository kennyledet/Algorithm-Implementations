#!/usr/bin/env python
# -*- coding: utf-8 -*-

'''
File: string_to_int.py
Author: tdoly
Description: string convert to int without a library, For example, int('111')
'''

def parseInt(number):
    if len(number) < 1:
        return None
    nums = [(ord(number[-(i+1)])-48) * 10**i for i in range(len(number))]
    return reduce(lambda x, y: x+y, nums)

def test():
    numtest = ['12345', '0', '1', '54321']
    for num in numtest:
        print parseInt(num) == int(num)

if __name__ == '__main__':
    test()
