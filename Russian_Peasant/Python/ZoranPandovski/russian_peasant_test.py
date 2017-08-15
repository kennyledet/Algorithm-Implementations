import unittest
from russian_peasant import russian_peasant as rp

class RussianPeasantTest(unittest.TestCase):
	def test_correct(self):
		self.assertEquals(rp(5,15), 75)

if __name__ == '__main__':
    unittest.main()
