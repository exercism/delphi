unit uBeerSong;

interface

type
  Beer = class
  public
    class function Verse(number: integer): string; static;
    class function Verses(start, stop: integer): string; static;
  end;

implementation
uses System.SysUtils;

class function Beer.Verse(number: integer): string;
begin
  case number of
    0:
    result := 'No more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall.\n';

    1:
    result := '1 bottle of beer on the wall, 1 bottle of beer.\nTake it down and pass it around, no more bottles of beer on the wall.\n';

    2:
    result := '2 bottles of beer on the wall, 2 bottles of beer.\nTake one down and pass it around, 1 bottle of beer on the wall.\n';

    else
      result := format(
                 '%d bottles of beer on the wall, %d bottles of beer.\nTake one down and pass it around, %d bottles of beer on the wall.\n',
                 [number, number, number - 1]);
  end; //case
end;

class function Beer.Verses(start, stop: integer): string;
var i: integer;
begin
   result := '';
   for i := start downto stop do
     if i = stop then
       result := result + Verse(i)
     else
       result := result + Verse(i) + '\n';
end;

end.
