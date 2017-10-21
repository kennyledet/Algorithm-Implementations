def isPalindrome(cad):
    size_cad = len(cad)
    for i in range(int(size_cad/2)):
        if cad[i] != cad[size_cad - i - 1]:
            return False
    return True

if __name__ == '__main__':
    words = ['hello','world','ana','alula']
    for i in words:
        print('is word ',"'",i,"' Palindrome? ",isPalindrome(i))
