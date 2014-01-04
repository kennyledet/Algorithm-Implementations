
'use strict';

/**
	* The Bresenham Algorithm, implemented in JS.
	* Learn more here: http://en.wikipedia.org/wiki/Bresenham's_line_algorithm
	* @author Evan Jacobs <evan@evoked.us>

	* The loop calculates each pairing and returns them as an array of comma-separated
	  string coordinates to be applied to a SVG (polyline) or canvas object.

	* @param {Number} x1 - start point x
	* @param {Number} y1 - start point y
	* @param {Number} x2 - end point x
	* @param {Number} y2 - end point y
	* @param {Boolean} debug - set to true to get function timing in your console

	* @returns {Array} point coordinates in "x,y" format
	*/

function bresenham_line( x1, y1, x2, y2, debug ){

	/*
		Points to be saved in comma-separated string pairs
		e.g. "41,0" for "x,y"
	*/

	if(debug) console.time('bresenham_line');

	var points = [];

	var dx = Math.abs( x2 - x1 );
	var dy = Math.abs( y2 - y1 );

	var err = 0;
	var derr = Math.abs( dy / dx );

	var y = y1;

	for( var x = x1, end = x2; x < end; x++ ){

		// Add coordinate string to array (includes x1,y1 by default)
		points.push( [x,y].join(',') );

		err += derr;

		if( err >= 0.5 ){
			y += 1;
			err -= 1;
		}

	}

	// Finally, add on the last set
	points.push( [x2,y2].join(',') );

	if(debug) console.timeEnd('bresenham_line');

	return points;
}

/*

	Example usage:

	var points = bresenham_line( 0, 0, 10, 10 );

	points => ["0,0", "1,1", "2,2", "3,3", "4,4", "5,5", "6,6", "7,7", "8,8", "9,9", "10,10"]

	This could then be used in an SVG polyline like this:
	$('<svg>').append('<polyline points="' + points.join(' ') + '" />');

*/
