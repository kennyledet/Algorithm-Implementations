'''
Created on 2013-12-31

@author: tdoly

shell sort
'''

def insertSort(ls):
    if len(ls) == 1:
        return ls
    b = insertSort(ls[1:])
    m = len(b)
    for i in range(m):
        if ls[0] <= b[i]:
            return b[:i] + [ls[0]] + b[i:]
    return b + [ls[0]]

def sort(ls, flag):
    '''using insertSort sort the ls'''
    
    sorteds = [insertSort(ls[begin::flag]) for begin in range(flag)]
    result = [elem for sorted in zip(*sorteds) for elem in sorted]
    
    if len(ls) % 2 != 0 and len(result) % 2 == 0:
        result.append(sorteds[0][-1])
    return result

def flags(lens):
    '''
    calculate the step length
    if len(ls) is 10,the flags is [5, 2, 1]
    '''
    
    flag = lens // 2
    return [flag] + flags(flag) if flag > 0 else []

def shellSort(unls):
    fgs = flags(len(unls))
    ls = unls
    for flag in fgs:
        ls = sort(ls, flag)
    return ls

def test():
    ls1 = [23, 89, 5, 17, 61, 35, 81, 27, 2, 61, 19] # len() is 11
    ls2 = [23, 89, 5, 17, 61, 35, 81, 27, 2, 61] # len() is 10
    ls3 = []
    print shellSort(ls1)
    print shellSort(ls2)
    print shellSort(ls3)

if __name__ == '__main__':
    test()
