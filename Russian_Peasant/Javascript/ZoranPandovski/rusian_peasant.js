'use strict'

const russian_peasant = function(num1,num2){
    let x = num1,
        y = num2,
        sum = 0;
    while(x > 0){
        if(x % 2 == 1){
            sum+=y;
        }
        x = x >> 1;
        y = y << 1;
    }

    return sum;
}

//test

const assert = function(condition, message) {
    if (!condition) {
        message = message || "Assertion failed";
        if (typeof Error !== "undefined") {
            throw new Error(message);
        }
        throw message; // Fallback
    }
}

const num1 = 12;
const num2 = 10;
const result = russian_peasant(num1,num2)
assert(result === 120);