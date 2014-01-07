<?php
require 'selection_sort.php';

class SelectionSortTest extends PHPUnit_Framework_TestCase{
    
    public function testEmptyArray(){
       $this->assertEmpty(selection_sort([])); 
    }

    public function testUnorderNumericArray(){
        $a = [324,234,9123,23234,32423,221231,123,28,0,121,123];
        $b = [324,234,9123,23234,32423,221231,123,28,0,121,123];
        sort($b, SORT_NUMERIC); 
        $this->assertEquals(selection_sort($a), $b);
    }
    
    public function testOrderNumericArray(){
        $a = [1,2,3,4,5,6,7,8,9];
        $b = [1,2,3,4,5,6,7,8,9];
        $this->assertEquals(selection_sort($a), $b);
    }

    public function testUnorderCharacterArray(){
        $a = ['A', 'Z', 'c', 't', 'C', 'a', 'y'];
        $b = ['A', 'Z', 'c', 't', 'C', 'a', 'y'];
        sort($b,SORT_STRING);
        $this->assertEquals(selection_sort($a), $b);
    }

    public function testOrderCharacterArray(){
        $a = ['a', 'b', 'c', 'd', 'e', 'f'];
        $b = ['a', 'b', 'c', 'd', 'e', 'f'];
        $this->assertEquals(selection_sort($a), $b);
    }
}
