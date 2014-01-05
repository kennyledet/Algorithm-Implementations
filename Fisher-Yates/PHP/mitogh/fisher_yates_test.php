<?php
require 'fisher_yates.php';
class FisherYates_Test extends PHPUnit_Framework_TestCase{
    private $test = [1,2,3,4,5,6,7,8,9];

    public function testEmptyArray(){
        $this->assertEquals([], fisher_yates([]));
    }

    public function testShuffleArray(){
        $tmp = $this->test;
        $this->assertNotEquals($this->test, fisher_yates($tmp));
    }
}
