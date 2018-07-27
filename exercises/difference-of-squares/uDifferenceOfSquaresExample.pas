unit uDifferenceOfSquares;

interface

function squareofSum(const aMax: integer): integer;
function sumOfSquares(const aMax: integer): integer;
function differenceOfSquares(const aMax: integer): integer;

implementation
uses System.Generics.Collections;

{$region 'worker functions'}
function GenerateNumbers(const aMax: integer): TList<integer>;
var
  lNumber: integer;
begin
  result := TList<integer>.create;
  for lNumber := 1 to aMax do
    result.Add(lNumber)
end;

function SquareNumbers(aNumbers: TList<integer>): TList<integer>;
var
  lNumber: integer;
begin
  result := TList<integer>.create;
  for lNumber in aNumbers do
  begin
    result.Add(sqr(lNumber));
  end;
end;

function Sum(const aNumbers: TList<integer>): integer;
var
  lNumber: integer;
begin
  result := 0;
  for lNumber in aNumbers do
    result := result + lNumber;
end;
{$endregion}

function squareofSum(const aMax: integer): integer;
var
  lNumbers: TList<integer>;
  lSum: integer;
begin
  lNumbers := GenerateNumbers(aMax);
  lSum := Sum(lNumbers);
  result := lSum * lSum;
end;

function sumOfSquares(const aMax: integer): integer;
var
  lNumbersSquared: TList<integer>;
begin
  lNumbersSquared := SquareNumbers(GenerateNumbers(aMax));
  result := Sum(lNumbersSquared);
end;

function differenceOfSquares(const aMax: integer): integer;
begin
  result := squareOfSum(aMax) - sumOfSquares(aMax);
end;


end.

