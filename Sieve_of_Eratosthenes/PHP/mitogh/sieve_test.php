<?php
require './sieve.php';

class Sieve_Test extends PHPUnit_Framework_TestCase{
    protected $sieve;

    public function setUp(){
        $this->sieve = sieve(1000);
    }

    public function test_number_2_as_a_prime(){
        $this->assertEquals($this->sieve[2], true);
    }

    public function test_number_137_as_a_prime(){
        $this->assertEquals($this->sieve[137], true);
    }

    public function test_number_233_as_a_prime(){
        $this->assertEquals($this->sieve[233], true);
    }

    public function test_number_977_as_a_prime(){
        $this->assertEquals($this->sieve[977], true);
    }

    public function test_number_1009_as_a_prime(){
        $this->assertNull($this->sieve[1009]);
    }

    public function test_0_as_a_prime(){
        $this->assertFalse($this->sieve[0]);
    }

    public function test_1_as_a_prime(){
        $this->assertFalse($this->sieve[1]);
    }

    public function test_1000_as_a_prime(){
        $this->assertFalse($this->sieve[1000]);
    }
}
