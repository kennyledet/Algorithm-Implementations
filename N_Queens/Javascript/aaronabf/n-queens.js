// Author: Aaron Friedlander 2014

// A function that memoizes a function
// Adapted from my code here https://github.com/aaronabf/n-queens/blob/master/n_queen.js

// To test on 8 queens:
// console.log(attemp(8));

// Main function, abstracted helper function
function attemp(n) {
  return try1(point(1,1), n, []);
}

// Converts two numbers into a "point" object
function point(x,y) {
  return { i : x, j : y };
}

// Tests that the point does not conflict with any other points on the board
function conflict(p1, board) {
  return board.some(function(p2) {
    return ((p1.i === p2.i) ||
            (p1.j === p2.j) ||
            (p1.i - p1.j === p2.i - p2.j) ||
            (p1.i + p1.j === p2.i + p2.j));
  });
}

// First mutual recursive function, helps construct array of points
function try1(p, n, board) {
  var results = try2(p, n, board);

  if (results) {
    return results;
  } else if (p.j === n) {
    return false;
  } else {
    return try1(point(p.i, p.j+1), n, board);
  }
}

// Second mutual recursive function, helps construct array of points
function try2(p, n, board) {
  if (conflict(p, board)) {
    return false;
  } else if (p.i === n) {
    board.unshift(p);
    return board;
  } else {
    var boardCopy = board.slice(0);
    boardCopy.unshift(p);
    return try1(point(p.i+1, 1), n, boardCopy);
  }
}
