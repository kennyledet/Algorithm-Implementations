// Author: Aaron Friedlander 2014

// Problem: You have 100 doors in a row that are all initially closed. You make
// 100 passes by the doors. The first time through, you visit every door and
// toggle the door (if the door is closed, you open it; if it is open, you
// close it). The second time you only visit every 2nd door (door #2, #4, #6,
// ...). The third time, every 3rd door (door #3, #6, #9, ...), etc, until you
// only visit the 100th door.

// Question: What state are the doors in after the last pass? Which are open,
// which are closed?

// Implemented in two ways:
// 1) Loop through array of "doors" opening respective doors in each iteration
// 2) The only doors that remain open are whose numbers are perfect squares.
// Using this knowledge, only doors with indices of a perfect square + 1 are
// opened.

function run(numberOfDoors) {
  // Array to represent the doors: false represents closed, true represents open
  var doors = Array.apply(null, new Array(numberOfDoors)).map(Boolean.prototype.valueOf,false);

  // Run algorithms
  var doorOutcome1 = iterateDoors(doors);
  var doorOutcome2 = perfectSquareDoors(doors);

  // Print out results
  if (doorOutcome1 === doorOutcome2) {
    for (var i = 0; i < numberOfDoors; i++) {
      var doorNum = i + 1;
      var doorVal = doorOutcome1[i] ? 'Open' : 'Closed';
      console.log('Door #' + doorNum + ' is ' + doorVal);
    }
  } else {
    console.log('There was a issue in the algorithm');
  }
}

function iterateDoors(doors) {
  for (var pass = 0; pass < doors.length; pass++) {
    for (var i = pass; i < doors.length; i += (pass + 1)) {
      doors[i] = !doors[i];
    }
  }

  return doors;
}

function isPerfectSquare(num) {
  // Javascript trick for determining if a number is a perfect square
  var sqrt = Math.sqrt(num);
  return (sqrt === (sqrt | 0));
}

function perfectSquareDoors(doors) {
  for (var i = 0; i < doors.length; i++) {
    if (isPerfectSquare(i+1)) {
      doors[i] = true;
    }
  }

  return doors;
}
