<?php
function insertion_sort($arr = []){
    $n = count($arr);

    for($i = 0; $i < $n; $i++){
        $element = $arr[$i];
        $j = $i; 
        while($j > 0 && $arr[$j-1] > $element){
            $arr[$j] = $arr[$j-1];
            $j--;
        }
        $arr[$j] = $element;
    }
    return $arr;
}
