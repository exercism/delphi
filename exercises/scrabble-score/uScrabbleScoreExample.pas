unit uScrabbleScore;

interface

uses
  System.Generics.Collections;

type
  TScrabble = class
  private
    const
      FValues : array ['A' .. 'Z'] of integer =
        (1, 3, 3, 2, 1, 4, 2, 4, 1, 8, 5, 1, 3, 1, 1, 3, 10, 1, 1, 1, 1, 4, 4, 8, 4, 10);
  public
    class function Score(AInp : string) : integer;
  end;

implementation

uses
  System.SysUtils;

class function TScrabble.Score(AInp: string): integer;
var
  C: char;
begin
  Result := 0;
  for C in AInp.ToUpperInvariant do
    Result := Result + FValues[C];
end;

end.
