unit uBeerSong;

interface

type
  Beer = class
  private
    class function Verse(number: integer): string; static;
  public
    class function Recite(start, takeDown: integer): string; static;
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

class function Beer.Recite(start, takeDown: integer): string;
var i: integer;
    stop: integer;
    verseNum: integer;
begin
   stop := (start - takeDown) + 1;
   result := '';
   for i := start downto stop do
   begin
     verseNum := i;
     if verseNum < 0 then
       verseNum := verseNum + 100;
     if i = stop then
       result := result + Verse(verseNum)
     else
       result := result + Verse(verseNum) + '\n';
   end;
end;

end.
