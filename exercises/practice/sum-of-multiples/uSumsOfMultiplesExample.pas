unit uSumsOfMultiples;

interface

type
  TMultiplesOf = class
    class function Sum(AGiven : integer; AMults : TArray<integer>) : integer;
  end;

implementation

uses
  System.Math, System.Generics.Collections;

class function TMultiplesOf.Sum(AGiven: integer; AMults: TArray<integer>): integer;
var
  m, i, C : integer;
  LUsed : TList<integer>;
  lHigh: integer;
begin
  Result := 0;
  Lused := TList<integer>.Create;
  for m in AMults do
  begin
    if IsZero(m) then
      lHigh := 0
    else
      lHigh := (aGiven - 1) div m;
    for i := 1 to lHigh do
    begin
      C := i * m;
      if not LUsed.Contains(C) then
      begin
        Result := Result + C;
        LUsed.Add(C)
      end;
    end;
  end;
  LUsed.DisposeOf;
end;

end.
