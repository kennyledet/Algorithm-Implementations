"""
AUTHOR : Alex Mathew
EMAIL : alexmathew003@gmail.com 

There is a lot I can do to improve this implementation.

"""

"""For a given binary word, print out its corresponding Hamming Coded word"""

import math

def FindKeyBits(n):
  keyBits=[]
  pad = int(math.ceil(math.log(n)/math.log(2)))
  for i in xrange(1, n+1):
    b = "{0:b}".format(i)
    b=b.zfill(pad)
    keyBits.append(b)
  return keyBits

def IsPowerOf2(x):
  return ((x&(x-1))==0)

def XOR(a, b):
  return str(int(a)^int(b))

def FindParityCount(m):
  r = math.ceil((math.log(m)/math.log(2))+1)
  return int(r)

def CalculateParity(keyBits, data, parityTrack):
  parity = '0'
  pbCount = 0
  for elem in keyBits:
    if not IsPowerOf2(int(elem,2)):
      if elem[-parityTrack]=='1':
        parity = XOR(parity, data[pbCount-int(elem,2)])
    else:
      pbCount+=1
  return parity

def ComputeHamming(data):
  dataLen = len(data)
  parityCount = FindParityCount(dataLen)
  hammingLen = dataLen + parityCount
  keyBits = FindKeyBits(hammingLen)
  hammingCode = []
  dataTrack = -1
  parityTrack = 1
  for i in xrange(1, hammingLen+1):
    if IsPowerOf2(i):
      parity = CalculateParity(keyBits, data, parityTrack)
      hammingCode.append(parity)
      parityTrack+=1
    else:
      hammingCode.append(data[dataTrack])
      dataTrack-=1
  hammingCode.reverse()
  for i in hammingCode:
    print i, 


def main():
  print 'The inputs are passed into the HammingCode() function as a string \n'
  print '\nSample runs - '
  print '\n\nINPUT : 1101'
  print 'OUTPUT : '
  ComputeHamming('1101')
  print '\n\nINPUT : 11011101'
  print 'OUTPUT : '
  ComputeHamming('11011101')
  print '\n\n'
  data = raw_input("Enter the word to be encoded : ")
  print '\nThe Hamming encoded word for', data, 'is : ',
  ComputeHamming(data)
  
if __name__ == '__main__':
  main()