/*
	parse string to int without library functions.
*/

var Parser = function(){

	function pow(base, exponent){

		if(exponent == 0)
			return 1;

		var total = base;
		var i=1;
		while(i < exponent){

			total *= base;
			i++;
		}

		return total;
	}


	this.parse = function(txt){

		var total =0;
		var exponent = txt.length-1;
		for(var i=0;i<txt.length;i++){
			
			total += (txt.charAt(i) * pow(10, exponent--));
		}
		return total;
	}
}