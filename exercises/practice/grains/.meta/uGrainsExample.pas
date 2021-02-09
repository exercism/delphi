unit uGrains;

interface

type
  Grains = class
    class function Square(aInteger: integer): UInt64; static;
    class function Total: UInt64; static;
  end;

implementation
uses System.SysUtils;

class function Grains.Square(aInteger: integer): UInt64;
begin
  if (aInteger < 1) or (aInteger > 64) then
    raise ERangeError.CreateFmt('Argument of %d is out of bounds.  Must be > 0 and < 65',[aInteger]);

  if aInteger = 1 then
    result := 1
  else
    result := 2 * Square(aInteger - 1);
end;

class function Grains.Total: UInt64;
var i: integer;
begin
  result := 0;
  for i := 1 to 64 do
    result := result + Square(i);
end;

end.
