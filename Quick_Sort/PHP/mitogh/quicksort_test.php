<?php
require 'quicksort.php';

class QuickSortTest extends PHPUnit_Framework_TestCase{
    
    public function testWithArrayEmpty(){
        $this->assertEmpty(quicksort([]));
    }

    public function testArrayWithUnorderElements(){
        $original = [12321,43535,2342423,4364576,2343323,3534534,212,1,2,0,234234,234,34];
        $copy = [12321,43535,2342423,4364576,2343323,3534534,212,1,2,0,234234,234,34];
        // Order the array copy
        sort($copy,SORT_NUMERIC);

        $this->assertEquals(quicksort($original), $copy);
    }

    public function testArrayWithOrderElements(){
        $original = [1,2,3,4,5,6,7,8,9];
        $copy = [1,2,3,4,5,6,7,8,9];
        $this->assertEquals(quicksort($original), $copy);
    }

    public function testArrayWithOrderElementsReverOrder(){
        $original = [9,8,7,6,5,4,3,2,1];
        $copy = [9,8,7,6,5,4,3,2,1];
        // Order the array copy
        sort($copy,SORT_NUMERIC);

        $this->assertEquals(quicksort($original), $copy);
    }
}
