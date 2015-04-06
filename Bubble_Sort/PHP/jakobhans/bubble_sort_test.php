<?php
require "bubble_sort.php"; 

class BubbleSortTest extends PHPUnit_Framework_TestCase{
    // Given an unorder array
    private $test = [4,6,1,6,5,9,4,100,-4,50];

    public function testOrderAnArray(){
        $sorted = $this->test; 
        sort($sorted, SORT_NUMERIC);
        $this->assertEquals($sorted, bubble_sort($this->test));
    }

    public function testNoParameters(){
        $this->assertEmpty(bubble_sort([]));
    }
}
