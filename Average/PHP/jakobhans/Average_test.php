<?php

require('Average.php');

class AverageTest extends PHPUnit_Framework_TestCase {

    private $test_array = array(3, 28, 54, 4, 98, 55, 102, 17, 39, 71);
    private $test_power = 17;
    private $test_weights = array(0.05, 0.2, 0.1, 0.05, 0.4, 0.01, 0.09, 0.03, 0.05, 0.02);

    public function testHarmonicMean()
    {
        $result = harmonicMean($this->test_array);
        $this->assertInternalType("float", $result);
    }

    public function testQuadraticMean()
    {
        $result = quadraticMean($this->test_array);
        $this->assertInternalType("float", $result);
    }

    public function testGeneralizedMean()
    {
        $result = generalizedMean($this->test_array, $this->test_power);
        $this->assertInternalType("float", $result);
    }

    public function testWeightedMean()
    {
        $result = weightedMean($this->test_array, $this->test_weights);
        $this->assertInternalType("float", $result);
    }

    public function testMidrangeMean()
    {
        $result = midrangeMean($this->test_array);
        $this->assertInternalType("float", $result);
    }
}