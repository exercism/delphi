unit uSaddlePoints;

interface
uses uSaddlePointsTests;

type
  ISaddlePoints = interface(IInvokable)
  ['{8C41B1A2-335D-4C6D-AF55-9F307F358227}']
    function Calculate: TArray<TTuple<integer, integer>>;
    function getStatus: string;
    property ToString: string read getStatus;
  end;

  function newSaddlePoints(aValues: TArray<TArray<integer>>): ISaddlePoints;

implementation
uses SysUtils, Spring.Collections;

type
  TSaddlePoints = class(TInterfacedObject, ISaddlePoints)
  private
    fValues: TArray<TArray<integer>>;
    fmaxRows: TArray<integer>;
    fminCols: TArray<integer>;
    fStatus: string;
    function getMaxRows: TArray<integer>;
    function getMinColumns: TArray<integer>;
    function Coordinates: IList<TTuple<integer, integer>>;
    function ColumnCount: integer;
    function RowCount: integer;
    function IsSaddlePoint(const coordinate: TTuple<integer, integer>): boolean;
    function getStatus: string;
  public
    constructor create(aValues: TArray<TArray<integer>>);
    function Calculate: TArray<TTuple<integer, integer>>;
    property ToString: string read getStatus;
  end;

function newSaddlePoints(aValues: TArray<TArray<integer>>): ISaddlePoints;
begin
  result := TSaddlePoints.create(aValues);
end;

constructor TSaddlePoints.create(aValues: TArray<TArray<Integer>>);
var I: integer;
    J: integer;
begin
  fValues := copy(aValues);
  fmaxRows := getMaxRows;
  fminCols := getMinColumns;
  fStatus := 'Calculation not performed';
end;

function TSaddlePoints.getStatus: string;
begin
  result := fStatus;
end;

function TSaddlePoints.getMaxRows: TArray<integer>;
var I: integer;
    J: integer;
    lRow: IList<integer>;
begin
  lRow := TCollections.CreateList<integer>;
  SetLength(result, RowCount);
  for I := 0 to RowCount - 1 do
  begin
    for J := 0 to ColumnCount - 1 do
      lRow.Add(fValues[I,J]);
    result[I] := lRow.Max;
    lRow.Clear;
  end;
end;

function TSaddlePoints.getMinColumns: TArray<integer>;
var I: integer;
    J: integer;
    lColumn: IList<integer>;
begin
  lColumn := TCollections.CreateList<integer>;
  SetLength(result, ColumnCount);
  for I := 0 to ColumnCount - 1 do
  begin
    for J := 0 to RowCount - 1 do
      lColumn.Add(fValues[J,I]);
    result[I] := lColumn.Min;
    lColumn.Clear;
  end;
end;

function TSaddlePoints.Coordinates: IList<TTuple<integer, integer>>;
var I, J: integer;
begin
  result := TCollections.CreateList<TTuple<integer, integer>>;
  for I := 0 to RowCount - 1 do
    for J := 0 to ColumnCount - 1 do
      result.Add(TTuple<integer, integer>.Create(I,J));
end;

function TSaddlePoints.Calculate: TArray<TTuple<integer, integer>>;
var lTuple: TTuple<integer, integer>;
begin
  result := Coordinates.Where(IsSaddlePoint).ToArray;
  if length(result) = 0 then
    fStatus := 'No saddle points'
  else
  begin
    fStatus := '';
    for lTuple in result do
      fStatus := fStatus + format('(%d,%d),',[lTuple.Value1, lTuple.Value2]);
    fStatus := fStatus.Remove(fStatus.Length - 1);
  end;
end;

function TSaddlePoints.ColumnCount: integer;
begin
  result := length(fValues[1]);
end;

function TSaddlePoints.RowCount: integer;
begin
  result := length(fValues);
end;

function TSaddlePoints.IsSaddlePoint(const coordinate: TTuple<integer, integer>): boolean;
begin
  result := (fmaxRows[coordinate.Value1] = fValues[coordinate.Value1, coordinate.Value2]) and
            (fminCols[coordinate.Value2] = fValues[coordinate.Value1, coordinate.Value2]);
end;

end.
