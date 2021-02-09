unit uPalindromeProducts;

interface

uses
  System.SysUtils;

type
  TPalindromeResult = TArray<TArray<TArray<integer>>>;
  TPalindromeProduct = class
  private
    class function IsPalindrom(ANum : integer) : boolean;
    class function Calculate(AMin, AMax, AExt : integer; ACond : TFunc<integer, integer, boolean>) : TPalindromeResult;
  public
    class function Largest(AMin, AMax : integer) : TPalindromeResult;
    class function Smallest(AMin, AMax : integer) : TPalindromeResult;
  end;

implementation

uses
  System.StrUtils;

{ TPalindromeProduct }

class function TPalindromeProduct.Calculate(AMin, AMax, AExt: integer;
  ACond: TFunc<integer, integer, boolean>) : TPalindromeResult;
var
  i, j, L, Mult: Integer;
begin
  if AMin > AMax then
    raise EArgumentException.Create('min must be <= max');

  Result := nil;
  for i := AMin to AMax do
    for j := i to AMax do
      if IsPalindrom(i * j) then
      begin
        Mult := i * j;

        if AExt = Mult then
        begin
          L := length(Result[1]);
          SetLength(Result[1], L + 1);
          Result[1, L] := [i, j];
        end;

        if ACond(AExt, Mult) then
        begin
          Result := [ [[Mult]], [[i, j]]];
          AExt := Mult;
        end;
      end;
end;

class function TPalindromeProduct.IsPalindrom(ANum: integer): boolean;
var s : string;
begin
  s := ANum.ToString;
  Result := s = ReverseString(s);
end;

class function TPalindromeProduct.Largest(AMin, AMax : integer): TPalindromeResult;
begin
  Result := Calculate(AMin, AMax, 0,
    function(Ext : integer; Mult : integer) : boolean
    begin
      Result := Ext < Mult;
    end);
end;

class function TPalindromeProduct.Smallest(AMin, AMax : integer): TPalindromeResult;
begin
  Result := Calculate(AMin, AMax, MaxInt,
    function(Ext : integer; Mult : integer) : boolean
    begin
      Result := Ext > Mult;
    end);
end;

end.
