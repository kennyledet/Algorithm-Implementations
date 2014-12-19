Ackermann := function( m, n )
  
  if m = 0 then
      return n + 1;
  elif m > 0 and n = 0 then
      return Ackermann( m - 1, 1 );
  fi;

  return Ackermann( m - 1, Ackermann( m, n - 1 ) );

end;


