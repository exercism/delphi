unit uDarts;

interface

type
  TDarts = class
    class function Score(AX, AY : Extended) : integer;
  end;

implementation

{ TDarts }

class function TDarts.Score(AX, AY: Extended): integer;
begin
  var Dist := sqrt(sqr(AX) + sqr(AY));
  Result := 10;
  if Dist > 1 then
    Result := 5;
  if Dist > 5 then
    Result := 1;
  if Dist > 10 then
    Result := 0;
end;

end.
