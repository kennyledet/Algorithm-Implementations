module.exports = function(m) {
  var sum = 0
  for(var i in m) {
    sum += m[i] * m[i]
  }
  return Math.sqrt(sum).toFixed(4)
}
