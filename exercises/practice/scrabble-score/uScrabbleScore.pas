unit uScrabbleScore;

interface

type
  TScrabble = class
  public
    class function Score(const aValue: string): Integer;
  end;

implementation

uses
  SysUtils;

class function TScrabble.Score(const aValue: string): Integer;
begin
  raise Exception.Create('Not yet implemented');
end;

end.
