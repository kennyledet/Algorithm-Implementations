
## recursive implementation

fibonacci_rec := function( n )
  
  if n = 1 or n = 2 then
      
      return 1;
      
  fi;
  
  return fibonacci_rec( n - 1 ) + fibonacci_rec( n - 2 );
  
end;

## iterative implementation

fibonacci_iterative := function( n )
  local prev, prev2, curr_fib; 
  
  if n = 1 or n = 2 then
      
      return 1;
      
  fi;
  
  prev := 1;
  
  prev2 := 1;
  
  while n > 2 do
      
      curr_fib := prev + prev2;
      
      prev2 := prev;
      
      prev := curr_fib;
      
      n := n - 1;
      
  od;
  
  return curr_fib;
  
end;

## using the internal function

fibonacci_internal := i -> Fibonacci( i );

## fibonacci iterator

fibonacci_iterator := function( )
  local previous_list;
  
  previous_list := [ 1, 1 ];
  
  return function( )
    local ret_val, tmp_val;
    
    ret_val := previous_list[ 1 ];
    
    tmp_val := previous_list[ 1 ] + previous_list[ 2 ];
    
    previous_list[ 1 ] := previous_list[ 2 ];
    
    previous_list[ 2 ] := tmp_val;
    
    return ret_val;
    
  end;
  
end;

