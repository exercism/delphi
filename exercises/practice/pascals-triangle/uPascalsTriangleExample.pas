unit uPascalsTriangle;

interface

const
  CanonicalVersion = '1.3.0';

type
  PascalsTriangle = class
  public
    class function Calculate(ADepth : integer) : TArray<TArray<integer>>;
  end;

implementation

uses System.SysUtils, System.Generics.Collections;

{ PascalsTriangle }

class function PascalsTriangle.Calculate(ADepth: integer): TArray<TArray<integer>>;

  function CalcNextRow(ADepth : integer) : TArray<TArray<integer>>;
  var  ALast : TArray<integer>;
      ANew : TList<integer>;
    i: integer;
  begin
    Result := [];
    ANew := TList<integer>.Create;
    while ADepth > 0 do
    begin
      ALast := [];
      if Length(Result) > 0 then
        ALast := Result[High(Result)];

      for i := Low(ALast) to High(ALast) do
        if i = Low(ALast) then
          ANew.Add(1)
        else
          ANew.Add(ALast[i - 1] + ALast[i]);
      ANew.Add(1);

      SetLength(Result, Length(Result) + 1);
      Result[High(Result)] := ANew.ToArray;
      dec(ADepth);
      ANew.Clear;
    end;
    ANew.DisposeOf;
  end;

begin
  if ADepth < 0 then
    raise EArgumentOutOfRangeException.Create('Argument have to be positive');
  Result := CalcNextRow(ADepth);
end;

end.
