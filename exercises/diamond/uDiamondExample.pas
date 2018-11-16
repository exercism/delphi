unit uDiamond;

interface

type
  TDiamond = class
    class function Rows(ALetter : char) : TArray<string>;
  end;

implementation

uses
  System.SysUtils;

{ TDiamond }

class function TDiamond.Rows(ALetter: char): TArray<string>;
var
  Pst, Lnt, i : Integer;
  ltr: Char;
begin
  Pst := ord(ALetter) - ord('A') + 1;
  Lnt := 2 * Pst - 1;
  SetLength(Result, Lnt);
  for i := 0 to pst - 1 do
  begin
    ltr := char(ord(ALetter) - i);
    Result[pst - i - 1] := StringOfChar(' ', lnt);
    Result[pst - i - 1, i + 1] := ltr;
    Result[pst - i - 1, Lnt - i] := ltr;
    Result[pst + i - 1] := Result[pst - i - 1];
  end;
end;

end.
