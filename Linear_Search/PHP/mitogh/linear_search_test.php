<?php
require "linear_search.php";

class linear_search_test extends PHPUnit_Framework_TestCase{
    protected $numbers;

    public function setUp(){
        $this->numbers = [123, 324, 3242, 1, 4, -123, -32, 234, 657, 87, 345, 786, 867, 34564];
    }

    public function test_key_found(){
        $this->assertTrue(linear_search($this->numbers, 1));
        $this->assertTrue(linear_search($this->numbers, 786));
        $this->assertTrue(linear_search($this->numbers, 34564));
        $this->assertTrue(linear_search($this->numbers, 123));
    }

    public function test_key_not_found(){
        $this->assertFalse(linear_search($this->numbers, 0));
        $this->assertFalse(linear_search($this->numbers, 20));
        $this->assertFalse(linear_search($this->numbers, 100));
        $this->assertFalse(linear_search($this->numbers, 9));
    }

    public function test_wrong_arguments(){
        $this->assertFalse(linear_search($this->numbers, true));
        $this->assertFalse(linear_search($this->numbers, false));
        $this->assertFalse(linear_search($this->numbers));
        
        $this->assertFalse(linear_search());
    }
}
