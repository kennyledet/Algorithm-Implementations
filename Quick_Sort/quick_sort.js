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