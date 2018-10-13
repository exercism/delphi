unit uAllYourBases;

interface

type
  TBase = class
  private
    class function BaseToDecimal(ABase : integer; ADigits :  TArray<integer>) : integer;
    class function DecimalToBase(AVal : integer; ABase : integer) : TArray<integer>;
  public
    class function Rebase(AInpBase : integer; ADigits :  TArray<integer>; AOutBase : integer ) : TArray<integer>;
  end;

implementation

uses
  System.Math, System.SysUtils , System.Generics.Collections;

{ TBase }

class function TBase.BaseToDecimal(ABase: integer;
  ADigits:  TArray<integer>): integer;
var
  i: Integer;
    dig : integer;
begin
  Result := 0;
  for i := 0 to Length(ADigits) - 1 do
  begin
    if (ADigits[i] < 0) or (ADigits[i] > (ABase - 1)) then
      raise EArgumentOutOfRangeException.Create('all digits must satisfy 0 <= d < input base');
    Result := Result + ADigits[i] * trunc(Power(ABase, Length(ADigits) - 1 - i));
  end;

end;

class function TBase.DecimalToBase(AVal, ABase: integer): TArray<integer>;
var L : TList<integer>;
begin
  L := TList<integer>.Create;
  if AVal = 0 then
    l.Add(0);
  while AVal > 0 do
  begin
    L.Insert(0, AVal mod ABase);
    AVal := AVal div ABase;
  end;
  Result := L.ToArray;
  L.DisposeOf;
end;

class function TBase.Rebase(AInpBase: integer; ADigits:  TArray<integer>;
  AOutBase: integer): TArray<integer>;
begin
  if AInpBase < 2 then
    raise EArgumentOutOfRangeException.Create('input base must be >= 2');
  if AOutBase < 2 then
    raise EArgumentOutOfRangeException.Create('output base must be >= 2');
  Result := DecimalToBase(BaseToDecimal(AInpBase, ADigits) , AOutBase);
end;

end.
