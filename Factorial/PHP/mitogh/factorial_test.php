<?php
require 'factorial.php';

class Factorial extends PHPUnit_Framework_TestCase{
    public function testZeroFactorial(){
        $this->assertEquals(factorial(0), 1);
        $this->assertEquals(factorial_iterative(0), 1);
    }
    public function testNormalFactorial(){
        $this->assertEquals(factorial(5), 120);
        $this->assertEquals(factorial_iterative(5), 120);
    }
    public function testNoParamsFactorial(){
        $this->assertEquals(factorial(), 1);
        $this->assertEquals(factorial_iterative(), 1);
    }
    public function testBothFunctions(){
        $this->assertEquals(factorial(10), factorial_iterative(10));
    }
}
