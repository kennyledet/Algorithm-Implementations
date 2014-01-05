<?php
function bogosort($arr = []){
    if(!count($arr)){
        return $arr;
    }

    $tmp = $arr;
    sort($tmp, SORT_NUMERIC);
    while ($arr != $tmp){
        shuffle($arr);
    }
   
    return $arr;
}
