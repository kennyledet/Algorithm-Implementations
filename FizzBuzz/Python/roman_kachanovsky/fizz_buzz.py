#!/usr/bin/env python
# -*- coding: utf-8 -*-

from __future__ import unicode_literals


def fizz_buzz(n):
    return 'Fizz' * (not n % 3) + ' ' * (not n % 15) + 'Buzz' * (not n % 5) or str(n)
