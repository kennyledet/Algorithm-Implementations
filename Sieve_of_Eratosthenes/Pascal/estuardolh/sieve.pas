unit sieve;

interface

uses crt;

const
  n = 50; { n cells }

type
  Cell = Record
           marked : Boolean; { True if a number is marked, false if not. }
           number : Integer; { Number in cell }
         end;

  Row = Array[0..n] of Cell; { A row is an array of Cells }
  PRow = ^Row;               { Pointer Type of Row }
  procedure row_fill( var a_row : Row );
  procedure row_print( var a_row : Row );
  procedure row_mark( a_row : PRow ; p : Integer );
  function row_lastnotmarked( a_row : Row ; p : Integer ) : Integer;
  procedure row_solve( var a_row : Row );

implementation

{ row is filled of numbers from 2 to n+1 }
procedure row_fill( var a_row : Row );
var
  i: Integer;
begin
  for i := 0 to n-1 do
  begin
    a_row[i].number := i+2;
  end;
end;

{ print a row as follow:
  [ n-3 ], [ n-2 ], ... [ n ]

  where a number not marked is white
  and a marked is red.

  when is printed i_ln cells in a row then
  a new line is wrote
 }
procedure row_print( var a_row : Row );
var
  i: Integer;
  i_ln: Integer = 4;
begin
  for i:= 0 to n-1 do
  begin
    textColor(White);
    if a_row[i].number < 10 then
      write('[  ')
    else
    begin
      write('[ ');
    end;

    if a_row[i].marked = True then
      textColor(LightRed)
    else
    begin
      textColor(White);
    end;

    write(a_row[i].number);
    textColor(White);
    write(' ], ');

    if (i + 1) mod i_ln = 0 then
      writeln;

  end;
  writeln;
end;

{ mark cells where number is a multiple of p }
procedure row_mark( a_row : PRow ; p : Integer );
var i : Integer;
begin
  for i := 0 to n-1 do
  begin
    if a_row^[i].number mod p = 0 then
    begin
      if a_row^[i].number > p then
      begin
        a_row^[i].marked := True;
      end;
    end;
  end;
end;

{ return the last number not marked greater than p }
function row_lastnotmarked( a_row : Row ; p : Integer ) : Integer;
var
  i : Integer;
begin
  for i := 0 to n-1 do
  begin
    if a_row[i].number > p then
    begin
      if a_row[i].marked = False then
      begin
        row_lastnotmarked := a_row[i].number;
        break;
      end;
    end;
  end;
end;

{ Solve Sieve of Eratosthenes.
  Cells in Row that are not marked has prime numbers.
}
procedure row_solve( var a_row : Row );
var
  i, p: Integer;
begin
  p := 2; { first prime number }

  for i := 0 to n-1 do
  begin
    { determine when to stop marking }
    if p * p > n then
    begin
      break;
    end;

    if a_row[i].number = p then
    begin
      row_mark( @a_row, p );
      p := row_lastnotmarked( a_row, p);
    end;
  end;
end;

end.
