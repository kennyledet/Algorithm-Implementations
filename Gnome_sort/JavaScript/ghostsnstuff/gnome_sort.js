/*
 *  gnome sort
 *  ----------
 *  author: ghostsnstuff
 *  date: March 27, 2014
 *  src: http://en.wikipedia.org/wiki/Gnome_sort
 *  complexity:
 *   - worst case O(n^2)
 *   - best case O(n)
 *   - avg case O(n^2) 
 */
module.exports = function(list) {
  var i = 1
  while(i < list.length) {
    if(list[i] >= list[i-1]) {
      i++
    } else {
      var temp = list[i]
      list[i] = list[i-1]
      list[i-1] = temp
      if(i > 1) i--
    }
  }
  return list
}
