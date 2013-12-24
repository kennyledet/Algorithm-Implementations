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

function TopDownSplitMerge(arrayOfNumbers) {     
    var length = arrayOfNumbers.length
    var middleIndex = parseInt(length/2);

    if(length <= 1) {
        return arrayOfNumbers;
    }                       

    // Split left side
    var left = TopDownSplitMerge(arrayOfNumbers.slice(0, middleIndex));  

    // Split right side
    var right = TopDownSplitMerge(arrayOfNumbers.slice(middleIndex, length));   

    // Merge every back together
    return TopDownMerge(left, right);
}
 
function TopDownMerge(left, right) {
    var results = [], 
        leftLength = left.length, 
        rightLength = right.length
        

    for(var leftIndex = 0, rightIndex = 0; 
		leftIndex < leftLength || rightIndex < rightLength; ) {

        // If left/right is empty, then keep pushing the other side
        if(leftIndex < leftLength && rightIndex < rightLength) { 
            if(left[leftIndex] <= right[rightIndex]) {
               results.push(left[leftIndex]);
               leftIndex++; 
            } else {
               results.push(right[rightIndex]);
               rightIndex++;
            }
        } else if(leftIndex < leftLength) {
           results.push(left[leftIndex]);
           leftIndex++; 
        } else {
           results.push(right[rightIndex]);
           rightIndex++;
        }
            
    }

    return results;
}

var sortedNumbers = TopDownSplitMerge([10, 1, 9, 2, 8, 3, 7, 4, 6, 5]);