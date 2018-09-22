unit uMatrix;

interface

uses System.SysUtils;

type
  Matrix = class
  private
    FMat : TArray<TArray<integer>>;
  public
    constructor Create(AMatr : string);
    function Row(AInd : integer) : TArray<integer>;
    function Column(AInd : integer) : TArray<integer>;
  end;

implementation

{ Matrix }

function Matrix.Column(AInd: integer): TArray<integer>;
var i : integer;
begin
  SetLength(Result, Length(FMat));
  for i := Low(FMat) to High(FMat) do
    Result[i] := FMat[i, AInd];
end;

constructor Matrix.Create(AMatr: string);
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

function Matrix.Row(AInd: integer): TArray<integer>;
begin
  Result := FMat[AInd];
end;

end.
