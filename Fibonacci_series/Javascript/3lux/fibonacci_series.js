
'use strict';

/**
	* A Fibonacci Sequence Generator, implemented in JS.
	* Learn more here: http://en.wikipedia.org/wiki/Fibonacci_number
	* @author Evan Jacobs <evan@evoked.us>

	* Generates a fibonacci sequence of N length.

	* @param {Number} length
	* @param {Number} seed - optional starting number
	* @param {Boolean} debug - set to true to get function timing in your console

	* @returns {Array} an array of fibonacci numbers
	*/

function fibonacci_sequence( length, seed, debug ){

	if(debug) console.time('fibonacci_sequence');

	// By default, we'll start the sequence with 1.
	seed = typeof seed === 'number' ? seed : 1;

	var sequence = [],
		previous = 0;

	while( length-- ){

		// Push seed value
		sequence.push(seed);

		// Prepare for next run
		seed += previous;
		previous = seed - previous;
	}

	if(debug) console.timeEnd('fibonacci_sequence');

	return sequence;
}
