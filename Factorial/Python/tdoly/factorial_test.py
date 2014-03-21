#!/usr/bin/env python
# -*- coding: utf-8 -*-

'''
File: factorial_test.py
Author: tdoly
Description: the factorial test
'''

import unittest
from factorial import factorial

class TestFactorial(unittest.TestCase):
    def template(self, test_list, test_result, method):
        for num, result in zip(test_list, test_result):
            self.assertEqual(method(num), result, msg="ERROR!factorial(%s) != %s" % (num, result))

    def test_factorial(self):
        test_list = (0, 1, 2, 3, 4, 5, 10)
        test_result = (1, 1, 2, 6, 24, 120, 3628800)
        self.template(test_list, test_result, factorial)

if __name__ == '__main__':
    unittest.main()
