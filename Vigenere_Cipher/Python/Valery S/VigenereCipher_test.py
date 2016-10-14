#Tests for vigenere_cipher.py
from VigenereCipher import VigenereCipher
VC = VigenereCipher()
assert(VC.cipher('take', 'care') == 'VABI')
assert(VC.decipher('VABI', 'care') == 'TAKE')

assert(VC.cipher('ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') == 'ACEGIKMOQSUWYACEGIKMOQSUWY')
assert(VC.decipher('ACEGIKMOQSUWYACEGIKMOQSUWY', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ') == 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')