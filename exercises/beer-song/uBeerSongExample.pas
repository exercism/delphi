unit uBeerSong;

interface

type
  Beer = class
  public
    class function Verse(number: integer): string; static;
    class function Sing(start, stop: integer): string; static;
  end;

implementation
uses System.SysUtils;

class function Beer.Verse(number: integer): string;
begin
  case number of
    0:
    result := 'No more bottles of beer on the wall, no more bottles of beer.' + sLineBreak +
              'Go to the store and buy some more, 99 bottles of beer on the wall.' + sLineBreak;

    1:
    result := '1 bottle of beer on the wall, 1 bottle of beer.' + sLineBreak +
              'Take it down and pass it around, no more bottles of beer on the wall.' + sLineBreak;

    2:
    result := '2 bottles of beer on the wall, 2 bottles of beer.' + sLineBreak +
              'Take one down and pass it around, 1 bottle of beer on the wall.' + sLineBreak;

    else
      result := format('%d bottles of beer on the wall, %d bottles of beer.' + sLineBreak +
                       'Take one down and pass it around, %d bottles of beer on the wall.' + sLineBreak,
                       [number, number, number - 1]);
  end; //case
end;

class function Beer.Sing(start, stop: integer): string;
var i: integer;
begin
   result := '';
   for i := start downto stop do
     result := result + Verse(i) + sLineBreak;
end;

end.
