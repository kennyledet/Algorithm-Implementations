function bottlesOfBeer(i) {
  var s;
  if (i == 1) {
    s = "1 bottle";
  } else if (i == 0) {
    s = "no more bottles";
  } else {
    s = i + " bottles";
  }
  return s + ' of beer';
}

var maxBottles = 99;
var string = '';
for (var i = maxBottles; i > 0; i--) {
  string += bottlesOfBeer(i) + ' on the wall, ' + bottlesOfBeer(i) + '.\n';
  string += 'Take one down, pass it around, ' + bottlesOfBeer(i-1) + ' on the wall.\n';
}
string += 'No more bottles of beer on the wall, no more bottles of beer.\n';
string += 'Go to the store and buy some more, ' + bottlesOfBeer(maxBottles) + ' on the wall.';

console.log(string);
