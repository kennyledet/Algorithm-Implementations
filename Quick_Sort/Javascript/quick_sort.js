/*
  Copyright (c) 2013  Douglas Mak

  Permission is hereby granted, free of charge, to any person obtaining a copy
  of this software and associated documentation files (the "Software"), to deal
  in the Software without restriction, including without limitation the rights
  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
  copies of the Software, and to permit persons to whom the Software is
  furnished to do so, subject to the following conditions:

  The above copyright notice and this permission notice shall be included in
  all copies or substantial portions of the Software.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
  THE SOFTWARE.
*/

function getRandomInt(numberOfNumbers, type) {   
    return Math.floor(Math.random() * (max - min + 1)) + min;
}

function swapElements(array, indexI, indexJ) {
    var temp = array[indexI];
    array[indexI] = array[indexJ];
    array[indexJ] = temp;
}

function partition(arrayOfNumbers, first, last, pivotIndex) {
    var pivotValue = arrayOfNumbers[pivotIndex];

    // Move pivot element to the last spot
    swapElements(arrayOfNumbers, pivotIndex, last);

    var i = first; 

    // One over from the right to exclude the pivot element
    for(var j = first; j < last; j++ ) {
        if(arrayOfNumbers[j] < pivotValue) {
            swapElements(arrayOfNumbers, i, j);
            i++;
        }
    }

    // Move element to where it belongs
    swapElements(arrayOfNumbers, i, last);
    return i;
}

function QuickSortRandomPivot(arrayOfNumbers, first, last) {
    if( first < last ) {
        var pivotIndex = getRandomInt(first, last);
        var newPivotIndex = partition(arrayOfNumbers, first, last, pivotIndex);
        QuickSortRandomPivot(arrayOfNumbers, first, newPivotIndex-1);
        QuickSortRandomPivot(arrayOfNumbers, newPivotIndex+1, last);
    }
    return arrayOfNumbers;
}

var sortedNumbers = QuickSortRandomPivot([10, 1, 9, 2, 8, 3, 7, 4, 6, 5], 0, numbersArray.length-1);   