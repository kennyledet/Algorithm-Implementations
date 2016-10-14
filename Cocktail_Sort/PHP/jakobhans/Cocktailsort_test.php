<?php

require('Cocktailsort.php');

class CocktailsortTest extends PHPUnit_Framework_TestCase {
    private $test_array = array(88, 4, 7, 85, 45, 3, 1, 66, 24, 59, 2);

    public function testCocktailsort()
    {
        $result = cocktailSort($this->test_array);
        sort($this->test_array, SORT_NUMERIC);

        $this->assertEquals($result, $this->test_array);
    }
}