<?php

require dirname(__DIR__) . '/../src/fizz-buzz-plugin-classes.php';

class FizzBuzzRuleTest extends \PHPUnit_Framework_TestCase
{

    /**
     * @var FizzBuzzRuleInterface
     */
    protected $rule;

    public function setUp()
    {
        $this->rule = new FizzBuzzRule(10, 'MyRule');
    }

    public function testRuleMatchNumber()
    {
        $this->assertTrue($this->rule->matchRule(10));
    }

    public function testRuleDoNotMatchNumber()
    {
        $this->assertFalse($this->rule->matchRule(11));
    }

    public function testOutput()
    {
        $this->assertSame('MyRule', $this->rule->getResponse());
    }

}
