unit uSieve;

interface

const
  CanonicalVersion = '1.1.0';

type
  TSieve = class
    class function Primes(AInp : integer) : TArray<integer>;
  end;

implementation

uses System.Generics.Collections;

{ TSieve }

class function TSieve.Primes(AInp: integer): TArray<integer>;
var Sieve : TList<boolean>;

  procedure Init;
  var
    i : integer;
  begin
    Sieve := TList<boolean>.Create;
    for i := 2 to AInp do
      Sieve.Add(true);
  end;

  procedure Sift;
  var
    i, j : integer;
  begin
    for i := 2 to Trunc(Sqrt(AInp)) do
      if Sieve.Items[i - 2] then
        for j := 2 to (AInp div i) do
          Sieve[(i ) * (j) - 2] := false;
  end;

  procedure Output;
  var
    i : integer;
    LOut : TList<integer>;
  begin
    LOut := TList<integer>.Create;
    for i :=  2 to AInp do
      if Sieve[i - 2] then
        LOut.Add(i );
    Result := LOut.ToArray;
    LOut.DisposeOf;
    Sieve.DisposeOf;
  end;

begin
  Init;
  Sift;
  Output;
end;

end.
