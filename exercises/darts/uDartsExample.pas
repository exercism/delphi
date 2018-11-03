unit uDarts;

interface

type
  TDarts = class
    class function Score(AX, AY : Extended) : integer;
  end;

implementation

{ TDarts }

class function TDarts.Score(AX, AY: Extended): integer;
var
  Dist: Extended;
begin
  Dist := sqrt(sqr(AX) + sqr(AY));
  if Dist > 10 then
    Result := 0;
  if (Dist > 5) and (Dist <= 10)  then
    Result := 1;
  if (Dist > 1) and (Dist <= 5)  then
    Result := 5;
  if (Dist <= 1)  then
    Result := 10;
end;

end.
