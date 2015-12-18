<?php

require_once dirname(__DIR__) . '/../src/fizz-buzz-function.php';

class FizzBuzzFunctionTest extends \PHPUnit_Framework_TestCase
{

    public function testNumber3()
    {
        $this->assertSame('Fizz', fizzBuzz(3));
    }

    public function testNumber5()
    {
        $this->assertSame('Buzz', fizzBuzz(5));
    }

    public function testNumber15()
    {
        $this->assertSame('FizzBuzz', fizzBuzz(15));
    }

    public function testNumber1()
    {
        $this->assertSame(1, fizzBuzz(1));
    }

    public function testNumber10()
    {
        $this->assertSame('Buzz', fizzBuzz(10));
    }

    public function testNumber13()
    {
        $this->assertSame(13, fizzBuzz(13));
    }
}
