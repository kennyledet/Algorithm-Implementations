
// Optimized quick array compare borrowed from here: http://stackoverflow.com/questions/7837456/comparing-two-arrays-in-javascript

function arraysIdentical(a, b) {
	var i = a.length;
	if (i != b.length) return false;
	while (i--) {
		if (a[i] !== b[i]) return false;
	}
	return true;
};

// Equivalent to bresenham_line( 0, 0, 10, 10 )
var example = ["0,0", "1,1", "2,2", "3,3", "4,4", "5,5", "6,6", "7,7", "8,8", "9,9", "10,10"];

console.assert( arraysIdentical( bresenham_line( 0, 0, 10, 10 ), example ), 'Arrays are not identical.' );
