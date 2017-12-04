unit uArmstrongNumbers;

interface
uses System.SysUtils, System.Math;

function isArmstrongNumber(aNumber: integer): Boolean;

implementation

function isArmstrongNumber(aNumber: integer): Boolean;
var wrkString: string;
    Exponent: integer;
    wrkInteger: integer;
    i: integer;
begin
  wrkString := aNumber.ToString;
  Exponent := length(wrkString);
  wrkInteger := 0;
  for i := low(wrkString) to high(wrkString) do
    wrkInteger := wrkInteger + trunc(Power(string.ToInteger(wrkString[i]), Exponent));
  result := wrkInteger = aNumber;
end;

end.
