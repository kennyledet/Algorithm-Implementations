/* 
 * Index Oriented Binary Search 
 * @author Jared Halpert (ghostsnstuff)
 * @params: sorted list, startIndex, stopIndex, and value to be located
 * @edge cases: list emtpy, startIndex > stopIndex, value exceeds range of list values
 * @logic 
 * update middle
 * return middle index if value found
 * recursive BinarySearch call, value < list[middle], reduce content to lower half of the list (adjust stopIndex)
 * recursive BinarySearch call, value > list[middle], reduce content to upper half of the list (adjust startIndex)
 * @description: http://en.wikipedia.org/wiki/Binary_search_algorithm
 */
function BinarySearch(list, startIndex, stopIndex, value) {

	if(list.length === 0) return 'list empty';
	if(startIndex > stopIndex) return 'startIndex > stopIndex';
	if((value < list[startIndex]) || (value > list[stopIndex])) return 'value out of bounds';

	var middle = Math.floor((startIndex + stopIndex)/2);
	if(list[middle] === value) return middle;
	else if(list[middle] > value) return BinarySearch(list, startIndex, middle - 1, value);
	else return BinarySearch(list, middle + 1, stopIndex, value);

}

// test
var data = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20];
var value = 7;
console.log(data);
console.log('find ' + value);
console.log('data[' + BinarySearch(data, 0, data.length-1, value) + '] = '+value);