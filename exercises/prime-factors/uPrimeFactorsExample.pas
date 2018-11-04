unit uPrimeFactors;

interface

type
  TPrimeFactors = class
  public
    class function factors(AVal: Int64): TArray<Int64>;
  end;

implementation

uses
  System.Threading, System.Generics.Collections, System.SyncObjs;

{ TPrimeFactors }

class function TPrimeFactors.factors(AVal: Int64): TArray<Int64>;
var
  factors : TList<Int64>;
  p: Int64;

  procedure Factorize(AP: Int64);
  begin
    while aval mod AP = 0 do
    begin
      AVal := AVal div AP;
      factors.Add(AP);
    end;
  end;

  function GatherFactors: TList<Int64>;
  begin
    factors := TList<Int64>.Create;
    Factorize(2);
    p := 3;
    while p <= Round(Sqrt(AVal)) do
    begin
      Factorize(p);
      p := p + 2;
    end;
    if AVal > 1 then
      factors.Add(AVal);
  end;

begin
  result := nil;
  try
    GatherFactors;
    Result := factors.ToArray;
  finally
    factors.DisposeOf;
  end;
end;

end.
