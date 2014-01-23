
bogosort := function( list )
  
  while not IsSortedList( list ) do
    
    Shuffle( list );
    
  od;
  
  return list;
  
end;
