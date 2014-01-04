
// Optimized quick array compare borrowed from here: http://stackoverflow.com/questions/7837456/comparing-two-arrays-in-javascript

function arraysIdentical(a, b) {
	var i = a.length;
	if (i != b.length) return false;
	while (i--) {
		if (a[i] !== b[i]) return false;
	}
	return true;
};

// Equivalent to fibonacci_sequence(20)
var example = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610, 987, 1597, 2584, 4181, 6765];

console.assert( arraysIdentical( fibonacci_sequence(20), example ), 'Arrays are not identical.' );
