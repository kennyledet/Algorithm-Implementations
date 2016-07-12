<?php

require('Bogobogosort.php');

class BogobogosortTest extends PHPUnit_Framework_TestCase {
    private $test_array = array(4, 17, 48, 2, 33);

    public function testBogobogosort()
    {
        $bogobogosort = new BogoBogoSort();

        $result = $bogobogosort->sortList($this->test_array);
        sort($this->test_array, SORT_NUMERIC);

        $this->assertEquals($result, $this->test_array);
    }
}