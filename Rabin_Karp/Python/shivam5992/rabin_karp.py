'''
Rabin Karp Algorithm for pattern matching.It is a string searching algorithm 
that uses hashing to find any one of a set of pattern strings in a text. 

'''

def rabin_karp(pat,txt):
    q = 19 # a random prime number to calcualte hash values
    d = 256  # number of input characters  
    h = 1 # hash function initial value
    flag = 0
    
    M = len(pat)
    N = len(txt)

    # hash function
    for i in range(0,M-1):
        h = (h*d)%q
    
    # initial hash values for pattern and text
    p = 0 
    t = 0  

    # hash values of pattern and first window of text
    for i in range(0,M):
        p = (d*p + ord(pat[i]))%q
        t = (d*t + ord(txt[i]))%q

    # sliding the pattern over text one by one 
    for i in range(0,N - M + 1):
        # If the hash values of current window and the pattern matches, then only check for characters on by one
        if p == t:
            for j in range(0,M):
                if txt[i+j] != pat[j]:
                    break
            if j+1 == M:  
                print "Pattern found at index", i
                flag = 1

        # Hash value for next window of text, Remove leading digit, add trailing digit           
        if i < N-M:
            t = (d*(t - ord(txt[i])*h) + ord(txt[i+M]))%q;
             
            if t < 0: 
              t = t + q
    if flag != 1:
        print "No pattern found"
  
if __name__ == '__main__':
    txt = "Driver program to test above function"
    pat = "test"  
    rabin_karp(pat, txt)
