const isPalindrome = function(cad) {
  size_cad = cad.length;
  for(let i=0; i<size_cad/2; i++){
    if(cad[i] != cad[size_cad-i-1])
      return 0;
  }
  return 1;
};

module.exports = isPalindrome;
