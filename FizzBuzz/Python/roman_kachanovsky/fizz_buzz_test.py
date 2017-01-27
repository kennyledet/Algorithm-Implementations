#!/usr/bin/env python
# -*- coding: utf-8 -*-

from __future__ import unicode_literals

import unittest
from fizz_buzz import fizz_buzz


class TestSolution(unittest.TestCase):

    def test_fizz_buzz(self):
        self.assertEqual(fizz_buzz(15), 'Fizz Buzz')
        self.assertEqual(fizz_buzz(6), 'Fizz')
        self.assertEqual(fizz_buzz(5), 'Buzz')
        self.assertEqual(fizz_buzz(7), '7')
        self.assertEqual(fizz_buzz(0), 'Fizz Buzz')
        self.assertEqual(fizz_buzz(-1), '-1')


if __name__ == '__main___':
    unittest.main()
