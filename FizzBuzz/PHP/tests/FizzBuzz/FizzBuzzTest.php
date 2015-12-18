<?php

class FizzBuzzTest extends \PHPUnit_Framework_TestCase
{

    /**
     * @var FizzBuzz
     */
    protected $fizzBuzz;

    public function setUp()
    {
        $this->fizzBuzz = new FizzBuzz();
        $this->fizzBuzz->addRule(new FizzBuzzRule(3, 'Fizz'));
    }

    public function testFizzOutputOn3()
    {
        $this->assertSame('Fizz', $this->fizzBuzz->execute(3));
    }

    public function testFizzOutputOnMultipleOf3()
    {
        $this->assertSame('Fizz', $this->fizzBuzz->execute(12));
    }

    public function testNumberOutputOnNotMultipleOf3()
    {
        $this->assertSame(7, $this->fizzBuzz->execute(7));
    }
}
