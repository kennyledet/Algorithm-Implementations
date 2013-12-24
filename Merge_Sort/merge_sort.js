// Taken from this repo: https://github.com/dagumak/design-patterns/blob/master/sorting-algorithms/mergesort.js

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