function fisher_yates(arr) {
  var m = arr.length,
          tmp,
          i;

  // While there's still elements to shuffle
  while (m) {

    // Index of random remaining element
    i = ~~(Math.random() * m--);

    tmp = arr[m];
    arr[m] = arr[i];
    arr[i] = tmp;
  }

  return arr;
}