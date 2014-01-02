<?php
function fisher_yates($a = []){
    $n = count($a);
    for($i = 0; $i < $n; $i++){
        $j = mt_rand(0,$i);
        $tmp = $a[$j];
        $a[$j] = $a[$i];
        $a[$i] = $tmp;
    }
    return $a;
}
