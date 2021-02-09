//========================================================================
// For this example solution I utilized Stefen Glienke's
// open-source code library Spring4D.  Latest version is available
// here: https://bitbucket.org/sglienke/spring4d
// Spring4D is not absolutely necessary, but it does greatly help
// facilitate a much simpler solution.
//
// Spring4D does include a Tuple record type that I have purposely
// not used in favor of my own, simple, TTuple that I declared in the
// test runner, in order to remove Spring4D dependency for test execution
//========================================================================
unit uSaddlePoints;

interface
uses uSaddlePointsTests;

type
  ISaddlePoints = interface(IInvokable)
  ['{8C41B1A2-335D-4C6D-AF55-9F307F358227}']
    function Calculate: TArray<TTuple<integer, integer>>;
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
    function getMaxRows: TArray<integer>;
    function getMinColumns: TArray<integer>;
    function Coordinates: IList<TTuple<integer, integer>>;
    function ColumnCount: integer;
    function RowCount: integer;
    function IsSaddlePoint(const coordinate: TTuple<integer, integer>): boolean;
  public
    constructor create(aValues: TArray<TArray<integer>>);
    function Calculate: TArray<TTuple<integer, integer>>;
  end;

function newSaddlePoints(aValues: TArray<TArray<integer>>): ISaddlePoints;
begin
  result := TSaddlePoints.create(aValues);
end;

constructor TSaddlePoints.create(aValues: TArray<TArray<Integer>>);
begin
  fValues := copy(aValues);
  fmaxRows := getMaxRows;
  fminCols := getMinColumns;
end;

function TSaddlePoints.getMaxRows: TArray<integer>;
begin
  var lRow := TCollections.CreateList<integer>;
  SetLength(result, RowCount);
  for var Row := 0 to RowCount - 1 do
  begin
    for var Col := 0 to ColumnCount - 1 do
      lRow.Add(fValues[Row,Col]);
    result[Row] := lRow.Max;
    lRow.Clear;
  end;
end;

function TSaddlePoints.getMinColumns: TArray<integer>;
begin
  var lColumn := TCollections.CreateList<integer>;
  SetLength(result, ColumnCount);
  for var Col := 0 to ColumnCount - 1 do
  begin
    for var Row := 0 to RowCount - 1 do
      lColumn.Add(fValues[Row,Col]);
    result[Col] := lColumn.Min;
    lColumn.Clear;
  end;
end;

function TSaddlePoints.Coordinates: IList<TTuple<integer, integer>>;
begin
  result := TCollections.CreateList<TTuple<integer, integer>>;
  for var Row := 0 to RowCount - 1 do
    for var Col := 0 to ColumnCount - 1 do
      result.Add(TTuple<integer, integer>.Create(Row,Col));
end;

function TSaddlePoints.Calculate: TArray<TTuple<integer, integer>>;
begin
  var wrkArray := Coordinates.Where(isSaddlePoint).ToArray;
  var wrkList := TCollections.CreateList<TTuple<integer, integer>>;
  for var Coordinate in wrkArray do
    wrkList.Add(TTuple<integer, integer>.Create(Coordinate.Value1 + 1, Coordinate.Value2 + 1));
  result := wrkList.ToArray;
end;

function TSaddlePoints.ColumnCount: integer;
begin
  if RowCount > 0 then
    result := length(fValues[0])
  else
    result := 0;
end;

function TSaddlePoints.RowCount: integer;
begin
  result := length(fValues);
end;

function TSaddlePoints.IsSaddlePoint(const coordinate: TTuple<integer, integer>): boolean;
begin
  var row := coordinate.Value1;
  var col := coordinate.Value2;
  result := (fmaxRows[row] = fValues[row, col]) and
            (fminCols[col] = fValues[row, col]);
end;

end.
