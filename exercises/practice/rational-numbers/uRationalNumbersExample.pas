unit uRationalNumbers;

interface

type
  TFraction = record
  strict private
    FNumerator: integer;
    FDenominator: integer;
    class function GCD(a, b: integer): integer; static;
  public
    function Reduced: TFraction;
    function ToString: string;
    function ToDouble: Double;

    property Numerator: integer read FNumerator;
    property Denominator: integer read FDenominator;

    class function CreateFrom(aNumerator: integer; aDenominator: integer): TFraction; static;

    class operator Add(const left, Right: TFraction): TFraction;
    class operator Add(const left: TFraction; const Right: double): double;
    class operator Add(const left: TFraction; const Right: integer): TFraction;
    class operator Add(const left: integer; const Right: TFraction): TFraction;
    class operator Subtract(const left, Right: TFraction): TFraction;
    class operator Multiply(const left, Right: TFraction): TFraction;
    class operator Multiply(const left: TFraction; const Right: Integer): TFraction;
    class operator Multiply(const left: Integer; const Right: TFraction): TFraction;
    class operator Divide(const left, Right: TFraction): TFraction;
    class operator Divide(const left: TFraction; const Right: Integer): TFraction;
    class operator Divide(const left: Integer; const Right: TFraction): TFraction;

    class operator Equal(const left, Right: TFraction): Boolean;
    class operator NotEqual(const left, Right: TFraction): Boolean;
    class operator LessThan(const left, right: TFraction): Boolean;
    class operator GreaterThan(const left, right: TFraction): Boolean;
    class operator LessThanOrEqual(const left, right: TFraction): Boolean;
    class operator GreaterThanOrEqual(const left, right: TFraction): Boolean;
    class operator Negative(const aValue: TFraction): TFraction;

    class operator Implicit(const aValue: integer): TFraction;
    class operator Implicit(const aValue: TFraction): Double;
    class operator Implicit(const aValue: Double): TFraction;

    class operator Explicit(const aValue: Double): TFraction;
    class operator Explicit(const aValue: TFraction): string;
    class operator Explicit(const aValue: TFraction): Double;
  end;

implementation
uses
  SysUtils;

{ TFraction }

class operator TFraction.Add(const left, Right: TFraction): TFraction;
begin
  Result := CreateFrom(left.Numerator * right.Denominator + left.Denominator * right.Numerator,
    left.Denominator * right.Denominator).Reduced;
end;

class operator TFraction.Add(const left: TFraction;
  const right: double): double;
begin
  var lDouble := Left;
  Result := LDouble + right;
end;

class operator TFraction.Add(const left: integer;
  const Right: TFraction): TFraction;
begin
  result := TFraction(left) + Right;
end;

class operator TFraction.Add(const left: TFraction;
  const Right: integer): TFraction;
begin
  Result := left + TFraction(Right);
end;

class function TFraction.CreateFrom(aNumerator,
  aDenominator: integer): TFraction;
begin
  if aDenominator = 0 then
    raise EZeroDivide.CreateFmt('Invalid fraction %d/%d, denominator cannot be zero',[aNumerator, aDenominator]);

  if aDenominator < 0 then
  begin
    Result.FNumerator := -aNumerator;
    Result.FDenominator := -aDenominator;
  end
  else
  begin
    Result.FNumerator := aNumerator;
    Result.FDenominator := aDenominator;
  end;
  Assert(Result.Denominator > 0);
end;

class operator TFraction.Divide(const left, Right: TFraction): TFraction;
begin
  Result := CreateFrom(left.Numerator * Right.Denominator, left.Denominator*Right.Numerator).Reduced;
end;

class operator TFraction.Divide(const left: TFraction;
  const Right: Integer): TFraction;
begin
  Result := CreateFrom(left.Numerator, left.Denominator * Right).Reduced;
end;

class operator TFraction.Divide(const left: Integer;
  const Right: TFraction): TFraction;
begin
  Result := CreateFrom(left * Right.Denominator, Right.Numerator).Reduced;
end;

class operator TFraction.Equal(const left, Right: TFraction): Boolean;
begin
  Result := left.Numerator * right.Denominator = right.Numerator * left.Denominator;
end;

class operator TFraction.Explicit(const aValue: Double): TFraction;
begin
  var LDenominator := 100000;
  var LNumerator := trunc(aValue * LDenominator);
  Result := CreateFrom(LNumerator, LDenominator).Reduced;
end;

class operator TFraction.Explicit(const aValue: TFraction): Double;
begin
  result := aValue.ToDouble;
end;

class operator TFraction.Explicit(const aValue: TFraction): string;
begin
  result := aValue.ToString;
end;

class function TFraction.GCD(a, b: integer): integer;
var
  rem: integer;
begin
  rem := a mod b;
  if rem = 0 then
    result := b
  else
    result := GCD(b, rem);
end;

class operator TFraction.GreaterThan(const left, right: TFraction): Boolean;
begin
  Result := left.Numerator * right.Denominator > right.Numerator * left.Denominator;
end;

class operator TFraction.GreaterThanOrEqual(const left,
  right: TFraction): Boolean;
begin
  Result := (left > right) or (left = right);
end;

class operator TFraction.Implicit(const aValue: Double): TFraction;
begin
  Result := TFraction(aValue);
end;

class operator TFraction.Implicit(const aValue: TFraction): Double;
begin
  Result := aValue.ToDouble;
end;

class operator TFraction.Implicit(const aValue: integer): TFraction;
begin
  Result := CreateFrom(aValue, 1);
end;

class operator TFraction.LessThan(const left, right: TFraction): Boolean;
begin
  Result := left.Numerator * right.Denominator < right.Numerator * left.Denominator;
end;

class operator TFraction.LessThanOrEqual(const left, right: TFraction): Boolean;
begin
  Result := (left < right) or (left = right);
end;

class operator TFraction.Multiply(const left: TFraction;
  const Right: Integer): TFraction;
begin
  Result := CreateFrom(left.Numerator * Right, left.Denominator).Reduced;
end;

class operator TFraction.Multiply(const left: Integer;
  const Right: TFraction): TFraction;
begin
  Result := CreateFrom(left * Right.Numerator, Right.Denominator).Reduced;
end;

class operator TFraction.Multiply(const left, Right: TFraction): TFraction;
begin
  result := CreateFrom(left.Numerator * right.Numerator, left.Denominator * right.Denominator).Reduced;
end;

class operator TFraction.Negative(const aValue: TFraction): TFraction;
begin
  Result := CreateFrom(-aValue.Numerator, aValue.Denominator);
end;

class operator TFraction.NotEqual(const left, Right: TFraction): Boolean;
begin
  Result := not (left = right);
end;

function TFraction.Reduced: TFraction;
var
  LGCD: integer;
begin
  LGCD := GCD(Numerator, Denominator);
  Result := CreateFrom(Numerator div LGCD, Denominator div LGCD);
end;

class operator TFraction.Subtract(const left, Right: TFraction): TFraction;
begin
  Result := Left + (-Right);
end;

function TFraction.ToDouble: Double;
begin
  Result := Numerator / Denominator;
end;

function TFraction.ToString: string;
begin
  Result := format('%d/%d',[Numerator, Denominator]);
end;

end.
