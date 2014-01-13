<?php 

require 'counting_sort.php'; 

class CountingSortTest extends PHPUnit_Framework_TestCase{

    public function testNoParameters(){
        $this->assertEmpty(counting_sort([]));
    }

    public function testArrayWithUnorderElements(){
        $original = [3,5,7,1,5,1,2,3,2,71,2,3,4,71,47,7];
        $copy = [3,5,7,1,5,1,2,3,2,71,2,3,4,71,47,7];
        sort($copy, SORT_NUMERIC);

        $this->assertEquals(counting_sort($original), $copy);
    } 
    
    public function testArrayWithOrderelements(){
        $original = [0,1,2,3,4,5,6,7,8,9,10];
        $copy = [0,1,2,3,4,5,6,7,8,9,10];
        
        $this->assertEquals(counting_sort($original), $copy);
    } 

    public function testArrayWithRepeatedElements(){
        $original = [1,1,1,1,1,1,1,1,1,1,1];
        $copy = [1,1,1,1,1,1,1,1,1,1,1];
        $this->assertEquals(counting_sort($original), $copy);
    }
}
