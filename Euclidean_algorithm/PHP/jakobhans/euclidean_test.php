<?php
require "euclidean.php";

class Euclidean extends PHPUnit_Framework_TestCase{
    // Test method gcm_division
    public function test_gcd_division(){
        $this->assertEquals(15, gcd_division(210,45));
        $this->assertEquals(0, gcd_division(0,0));
        $this->assertEquals(1, gcd_division(20,97));
    }

    // Test method gcd_substraction
    public function test_gcd_substraction(){
        $this->assertEquals(15, gcd_substraction(210,45));
        $this->assertEquals(0, gcd_substraction(0,0));
        $this->assertEquals(1, gcd_substraction(20,97));
    }
    // Test method gcd_recursive
    public function test_gcd_recursive(){
        $this->assertEquals(15, gcd_recursive(210,45));
        $this->assertEquals(0, gcd_recursive(0,0));
        $this->assertEquals(1, gcd_recursive(20,97));
    }
}
