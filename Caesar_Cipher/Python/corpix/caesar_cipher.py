import string

alphabet = string.ascii_letters
alphabet_len = len(alphabet)
alphabet_map = dict((v, i) for i, v in enumerate(alphabet))

def caesar_cipher(s, shift_num):
    if abs(shift_num) > alphabet_len:
        raise RuntimeError('Shift num is bigger than whole alphabet')

    res = []
    for char in s:
        index = alphabet_map[char] + shift_num
        if abs(index) >= alphabet_len:
            index = abs(index) - alphabet_len

        res.append(alphabet[index])

    return ''.join(res)

def main():
    input_string = raw_input('Enter a string to encrypt using Caesar Cipher\n')

    encrypted_string = caesar_cipher(input_string, -3)
    print encrypted_string

if __name__ == '__main__':
    main()

