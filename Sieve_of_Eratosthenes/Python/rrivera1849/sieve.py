def sieve(limit):
    primes = {k:True for k in range(3,limit+1,2)}

    for u in range(3,limit+1,2):
        for i in range(u**2,limit+1,2*u):
            primes[i] = False

    primes[2] = True
    return [u for u in primes if primes[u]==True]


# Testing to see if there are 78498 primes below 1 million

print len(sieve(1000000)) == 78498
