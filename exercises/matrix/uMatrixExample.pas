unit uMatrix;

interface

type
  TMatrix = class
  private
    FMat : TArray<TArray<integer>>;
  public
    constructor Create(AMatr : string);
    function Row(AInd : integer) : TArray<integer>;
    function Column(AInd : integer) : TArray<integer>;
  end;

implementation
uses System.SysUtils;

{ TMatrix }

function TMatrix.Column(AInd: integer): TArray<integer>;
var i : integer;
begin
  SetLength(Result, Length(FMat));
  for i := Low(FMat) to High(FMat) do
    Result[i] := FMat[i, AInd - 1];
end;

constructor TMatrix.Create(AMatr: string);
var Rows, Elems : TArray<string>;
    i, j : integer;
begin
  Rows := AMatr.Split(['\n']);
  SetLength(FMat, Length(Rows));
  for i := Low(Rows) to High(rows)  do
  begin
    Elems := Rows[i].Split([' ']);
    SetLength(FMat[i], Length(Elems));
    for j := Low(Elems) to High(Elems) do
      FMat[i, j] := Elems[j].ToInteger;
  end;
end;

function TMatrix.Row(AInd: integer): TArray<integer>;
begin
  Result := FMat[AInd - 1];
end;

end.
