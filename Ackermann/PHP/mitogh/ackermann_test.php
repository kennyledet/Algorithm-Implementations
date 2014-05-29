<?php
require './ackermann.php';

class ackermann_test extends PHPUnit_Framework_TestCase{
    public function testRightAnswers(){
        $this->assertEquals(ackermann(0, 0), 1);
        $this->assertEquals(ackermann(0, 1), 2);
        $this->assertEquals(ackermann(0, 2), 3);
        $this->assertEquals(ackermann(2, 2), 7);
        $this->assertEquals(ackermann(2, 4), 11);
        $this->assertEquals(ackermann(3, 2), 29);
        $this->assertEquals(ackermann(3, 5), 253);
    }
    public function testWrongAnswers(){
        $this->assertNotEquals(ackermann(0, 0), 0);
        $this->assertNotEquals(ackermann(0, 3), 2);
        $this->assertNotEquals(ackermann(0, 2), 5);
        $this->assertNotEquals(ackermann(2, 2), 10);
        $this->assertNotEquals(ackermann(2, 4), 12);
        $this->assertNotEquals(ackermann(3, 2), 40);
        $this->assertNotEquals(ackermann(3, 5), 256);
    }
}
