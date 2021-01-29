unit uPerfectNumbers;

interface
uses System.SysUtils;

type
  ENotNaturalNumber = class(Exception);

  NumberType = (Perfect, Abundant, Deficient);

  PerfectNumber = class
  public
    class function Classify(aNumber: integer): Numbertype; static;
  end;

implementation

class function PerfectNumber.Classify(aNumber: Integer): NumberType;
var sumOfFactors: integer;
    i: integer;
begin
  if aNumber < 1 then
    raise ENotNaturalNumber.Create('Classification is only possible for natural numbers.');

  sumOfFactors := 0;

  for i := 1 to aNumber - 1 do
    if aNumber mod i = 0 then
      sumOfFactors := sumOfFactors + i;

  if sumOfFactors < aNumber then
    result := Deficient
  else
    if sumOfFactors = aNumber then
      result := Perfect
    else
      result := Abundant;
end;

end.
