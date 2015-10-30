<?php

require('DecimalToFraction.php');

class DecimalToFractionTest extends PHPUnit_Framework_TestCase {
    private $test_decimal = '0.075';

    public function testDecimalToFraction()
    {
        $result = convertToFraction($this->test_decimal);

        $this->assertInternalType('integer', $result['numerator']);
        $this->assertInternalType('integer', $result['denominator']);

        $this->assertEquals(3, $result['numerator']);
        $this->assertEquals(40, $result['denominator']);
    }
}