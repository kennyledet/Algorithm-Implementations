<?php

// This one is so comically wrong I had to implement it :) -  http://www.dangermouse.net/esoteric/bogobogosort.html

class BogoBogoSort {

    public function sortList($numbers_list)
    {
        while (!$this->isSorted($numbers_list)) {
            shuffle($numbers_list);
        }

        return $numbers_list;
    }

    public function isSorted($numbers_list)
    {
        if (count($numbers_list) <= 1) {
            return TRUE;
        }

        $last_element = count($numbers_list) - 1;

        $array_copy = $numbers_list;
        $array_copy_to_sort = array();
        $array_sorted = array();

        do {
            shuffle($array_copy);
            for ($i = 0; $i < count($array_copy) - 1; $i++) {
                $array_copy_to_sort[$i] = $array_copy[$i];
            }
            $array_sorted = $this->sortList($array_copy_to_sort);
        } while($array_copy[$last_element] < max($array_sorted));

        for ($i = 0; $i < count($array_sorted); $i++) {
            $array_copy[$i] = $array_sorted[$i];
        }

        for ($i = 0; $i < count($numbers_list); $i++) {
            if ($array_copy[$i] !== $numbers_list[$i]) {
                return FALSE;
            }
        }

        return TRUE;
    }

}

?>