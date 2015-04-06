import string

def caesar_cipher(_string, shift_dir, shift_num):
    alphabet = ''.join(sorted(list(set(string.letters.upper()))))

    # Always shift right
    # If shift_dir is left, subtract shift_num from alphabet length
    if shift_dir == "left": shift_num = 26 - shift_num

    # Build cipher as dictionary mapping
    cipher = {}
    for position, letter in enumerate(alphabet):
        cipher[letter] = alphabet[position-shift_num]

    # Swap each dictionary value pair to make key
    cipher_key = dict(zip(cipher.values(), cipher.keys()))

    # Perform encryption
    return ''.join( map(lambda l: cipher_key[l.upper()], _string) )


def main():
    input_string = raw_input("Enter a string to encrypt using Caesar Cipher\n")

    encrypted_string = caesar_cipher(input_string, "left", 3)
    print encrypted_string

if __name__ == "__main__":
    main()
