unit uIsogram;

interface

function isIsogram(aWords: string): Boolean;

implementation
uses SysUtils, System.Character;

function isIsogram(aWords: string): Boolean;
var
  Letters: string;
  _Char: char;
begin
  result := true;
  Letters := '';
  for _Char in aWords.ToLowerInvariant do
    if _Char.IsLetter then
    begin
      if Letters.Contains(_Char) then
        exit(false)
      else
        Letters := Letters + _Char;
    end;
end;

end.

