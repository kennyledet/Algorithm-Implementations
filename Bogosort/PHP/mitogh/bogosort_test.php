<?php
require 'bogosort.php';

class BogoSortTest extends PHPUnit_Framework_TestCase{
    private $unorder = [3, 3242, 21, 55, 653, 19, 139, 459, 138, 45349, 19, 2, 1];

    public function testEmptyArray(){
        $this->assertEquals([], bogosort([]));
    }

    public function testUnOrderArray(){
        $tmp = $this->unorder;
        sort($this->unorder, SORT_NUMERIC);
        $this->assertEquals($this->unorder, bogosort($tmp));
    }
}
