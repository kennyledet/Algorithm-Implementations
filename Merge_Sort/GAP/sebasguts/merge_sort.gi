
merge_lists := function( list1, list2 )
  local i, j, merged_list;
  
  merged_list := [ ];
  
  i := 1;
  
  j := 1;
  
  while i <= Length( list1 ) and j <= Length( list2 ) do
      
      if list1[ i ] <= list2[ j ] then
          
          Add( merged_list, list1[ i ] );
          
          i := i + 1;
          
      else
          
          Add( merged_list, list2[ j ] );
          
          j := j + 1;
          
      fi;
      
  od;
  
  if i <= Length( list1 ) then
      
      Append( merged_list, list1{[ i .. Length( list1 ) ]} );
      
  else
      
      Append( merged_list, list2{[ j .. Length( list2 ) ]} );
      
  fi;
  
  return merged_list;
  
end;

merge_sort := function( list )
  local lists_to_merge;
  
  if Length( list ) = 1 then
      
      return list;
      
  fi;
  
  lists_to_merge := [ ];
  
  lists_to_merge[ 1 ] := merge_sort( list{[ 1 .. Int( Length( list ) / 2 ) ]} );
  
  lists_to_merge[ 2 ] := merge_sort( list{[ Int( Length( list ) / 2 ) + 1 .. Length( list ) ]} );
  
  return merge_lists( lists_to_merge[ 1 ], lists_to_merge[ 2 ] );
  
end;

