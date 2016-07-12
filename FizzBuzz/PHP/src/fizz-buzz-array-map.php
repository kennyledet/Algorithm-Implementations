<?php

echo implode("\n", array_map(function($i){
    if ($i % 15 === 0) {
        return 'FizzBuzz';
    }
    if ($i % 3 === 0) {
        return 'Fizz';
    }
    if ($i % 5 === 0) {
        return 'Buzz';
    }

    return $i;

}, range(1,100)));
