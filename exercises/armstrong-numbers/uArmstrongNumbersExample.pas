unit uArmstrongNumbers;

interface
uses System.SysUtils, System.Math;

function isArmstrongNumber(aNumber: integer): Boolean;

implementation

function isArmstrongNumber(aNumber: integer): Boolean;
var
  wrkNumber: integer;
  Calculation: integer;
  valLength: integer;
begin
  wrkNumber := aNumber;
  Calculation := 0;
  valLength := aNumber.ToString.Length;
  while wrkNumber > 0 do
  begin
    Calculation := Calculation + trunc(IntPower((wrkNumber mod 10), valLength));
    wrkNumber := wrkNumber div 10;
  end;
  result := aNumber = Calculation;
end;

end.
