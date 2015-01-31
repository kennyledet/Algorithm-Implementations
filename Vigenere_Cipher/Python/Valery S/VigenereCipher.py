import string

class VigenereCipher:

    def __init__(self):
        self._alphabet = string.uppercase[:26]

    def cipher(self, word, key):
        if len(word) != len(key):
            raise ValueError('Key should be same length as encrypted word!')
        word_letter_indexes = zip(self._alphabet_indexes(word), self._alphabet_indexes(key))
        encrypted_word = [self._alphabet[key+word if key+word<len(self._alphabet) else (key+word)-len(self._alphabet)]
                                                                                for key, word in word_letter_indexes]
        return string.join(encrypted_word, '')

    def decipher(self, cipher, key):
        if len(cipher) != len(key):
            raise ValueError('Key should be same length as encrypted word!')
        word_letter_indexes = zip(self._alphabet_indexes(cipher), self._alphabet_indexes(key))
        decrypted_word = [self._alphabet[cipher-key if cipher-key >= 0 else len(self._alphabet) + (cipher-key)]
                                                                        for cipher, key in word_letter_indexes]
        return string.join(decrypted_word, '')

    def _alphabet_indexes(self, word):
        try:
            word_letter_indexes = [self._alphabet.index(word_letter) for word_letter in word.upper()]
        except ValueError:
            raise ValueError('Encrypted word as a key should contains only letter of latin alphabet')
        return word_letter_indexes

