/* 
 * create an arbitrary list of ints and print out their values
 * sort the array
 * print the sorted values
 */ 
var cocktailsort = require('./CocktailSort.js');
var array = [45,1,23,-9,99,65];
console.log('initial values:  ' + array);
cocktailsort(array);
console.log('sorted  values:  ' + array);