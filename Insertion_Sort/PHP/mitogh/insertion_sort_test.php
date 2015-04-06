<?php
require_once 'insertion_sort.php';

class InsertionSortTest extends PHPUnit_Framework_TestCase{
    private $unorder = [3, 3242, 21, 55, 653, 19, 139, 459, 138, 45349, 19, 2, 1];

    public function testUnOrderArray(){
        $sorted = $this->unorder;
        sort($sorted, SORT_NUMERIC);
        $this->assertEquals($sorted, insertion_sort($this->unorder));
    }

    public function testOrderArray(){
        $sorted = $this->unorder;
        sort($sorted, SORT_NUMERIC);
        $this->assertEquals($sorted, insertion_sort($this->unorder));
    }

    public function testNoParameters(){
        $this->assertEmpty(insertion_sort([]));
    }
}
