<?php
function linear_search($arr = [], $key = false){
    foreach($arr as $element){
        if($element === $key){
            return true;
        }
    }
    return false;
}
