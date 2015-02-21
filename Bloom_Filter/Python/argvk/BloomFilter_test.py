from BloomFilter import BloomFilter

bf = BloomFilter()

bf.add("python")
bf.add("vk")

assert(bf.check("python") == True)
assert(bf.check("vk") == True)
assert(bf.check("kaboom") == False)
