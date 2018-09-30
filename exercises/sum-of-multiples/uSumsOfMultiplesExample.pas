unit uSumsOfMultiples;

interface

type
  TMultiplesOf = class
    class function Sum(AGiven : integer; AMults : TArray<integer>) : integer;
  end;

implementation

uses
  System.Generics.Collections;

class function TMultiplesOf.Sum(AGiven: integer; AMults: TArray<integer>): integer;
var
  m, i, C : integer;
  LUsed : TList<integer>;

begin
  Result := 0;
  Lused := TList<integer>.Create;
  for m in AMults do
  begin
    for i := 1 to (AGiven - 1) div m do
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
