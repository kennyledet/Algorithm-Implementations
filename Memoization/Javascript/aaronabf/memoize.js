// Author: Aaron Friedlander 2014

// A function that memoizes a function
// Adapted from my code here https://github.com/aaronabf/memoization/blob/master/memoizer.js

// Stores cached results
var dict = {};

// Memoizes a function
function memoizer(f) {
  function newFunction(n) {
    if (dict[n]) {
      return dict[n];
    }

    var newVal = f(newFunction, n);
    dict[n] = newVal;
    return newVal;
  }

  return newFunction;
}

// Test on fibonnaci
function fibMemo(g, n) {
  if (n === 0) {
    return 0;
  } else if (n === 1) {
    return 1;
  } else {
    return g(n-2) + g(n-1);
  }
}
var fib = memoizer(fibMemo);
