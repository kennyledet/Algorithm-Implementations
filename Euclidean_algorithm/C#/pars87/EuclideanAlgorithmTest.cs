using Algorithms.algorithm;
using Xunit;

namespace AlgorithmsTests.algorithm {

/*
 * test file
 * test division and recursive implementations
 */
    public class EuclideanAlgorithmTest {
        [Fact]
        public void GetGcdIterativeTest() {
            const uint expected = 6;
            var actual = EuclideanAlgorithm.GetGcdIterative(192, 270);
            Assert.Equal(expected, actual);
        }

        [Fact]
        public void GetGcdRecuriveTest() {
            const uint expected = 21;
            var actual = EuclideanAlgorithm.GetGcdRecurive(462, 1071);
            Assert.Equal(expected, actual);
        }
    }
}