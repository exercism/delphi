unit uTwelveDays;

interface

type
  TwelveDays = class
  public
    class function Recite(aVerse: integer): string; overload;
    class function Recite(startVerse, endVerse: integer): string; overload;
  end;

implementation
uses System.SysUtils;

class function TwelveDays.Recite(aVerse: integer): string;
const
  cGenericVerseBegin = 'On the %s day of Christmas my true love gave to me: ';
  cFirstToTwelfth : array[1..12] of string = ('first',
                                              'second',
                                              'third',
                                              'fourth',
                                              'fifth',
                                              'sixth',
                                              'seventh',
                                              'eighth',
                                              'ninth',
                                              'tenth',
                                              'eleventh',
                                              'twelfth');
var
  i: integer;
begin
  result := format(cGenericVerseBegin,[cFirstToTwelfth[aVerse]]);
  for i := aVerse downto 1 do
    case i of
      1:
        result := result + 'a Partridge in a Pear Tree.';
      2:
        result := result + 'two Turtle Doves, and ';
      3:
        result := result + 'three French Hens, ';
      4:
        result := result + 'four Calling Birds, ';
      5:
        result := result + 'five Gold Rings, ';
      6:
        result := result + 'six Geese-a-Laying, ';
      7:
        result := result + 'seven Swans-a-Swimming, ';
      8:
        result := result + 'eight Maids-a-Milking, ';
      9:
        result := result + 'nine Ladies Dancing, ';
      10:
        result := result + 'ten Lords-a-Leaping, ';
      11:
        result := result + 'eleven Pipers Piping, ';
      12:
        result := result + 'twelve Drummers Drumming, ';
  end; //case
end;

class function TwelveDays.Recite(startVerse, endVerse: integer): string;
var
  i: integer;
  _start,
  _end: integer;
begin
  result := '';
  _start := startVerse;
  _end := endVerse - 1;
  for i := _start to _end do
    result := result + Recite(i) + '\n';
  result := result + Recite(endVerse);
end;

end.
