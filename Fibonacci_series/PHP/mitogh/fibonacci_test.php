<?php
require 'fibonacci.php';

class FibonacciTest extends PHPUnit_Framework_TestCase{
    public function testCeroFibonacci(){
        $this->assertEquals(fibonacci(0), 0);
        $this->assertEquals(fibonacci_iterative(0), 0);
    }
    public function testPositiveNumberFibonnacci(){
        // Given the next order
        // Keys     [0..14]
        // Values   [0,1,1,2,3,5,8,13,21,34,55,89,144,233,377]
        $this->assertEquals(fibonacci(14), 377);
        $this->assertEquals(fibonacci_iterative(14), 377);
    }
}
