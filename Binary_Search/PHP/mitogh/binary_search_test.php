<?php
require_once('binary_search.php');
class BinarySearchTest extends PHPUnit_Framework_TestCase{
    // Given a sorted array
    private $test = [1,2,3,4,5,6,7,8,9];

    public function testElementFound(){
        $element = $this->test[5];
        $index = binary_search($this->test, $element); 
        $this->assertEquals($element, $this->test[$index] );
    } 

    public function testElementNotFound(){
        $index = binary_search($this->test, 50);
        $this->assertEquals(-1, $index);
    }

    public function testEmptyArray(){
        $this->assertEquals(-1, binary_search(array(), 50));
    }

    public function testNotArray(){
        $this->assertEquals(-1, binary_search("Hello, world!", 50));
    }

    public function testNotTarget(){
        $this->assertEquals(-1, binary_search(array(), "Hello, world!"));
    }
}
