unit uPascalsTriangleTests;

interface
uses
  DUnitX.TestFramework, uPascalsTriangle;

const CanonicalVersion = '1.5.0.1';

type
  TMatrix = TArray<TArray<integer>>;

  [TestFixture]
  TPascalsTriangleTest = class(TObject)
  private
    procedure CompareIntMatrices(AExpected, AActual : TArray<TArray<integer>>);
  public

    [Test]
//    [Ignore('Comment the "[Ignore]" statement to run the test')]
    procedure zero_rows;

    [Test]
    [Ignore]
    procedure single_row;

    [Test]
    [Ignore]
    procedure two_rows;

    [Test]
    [Ignore]
    procedure three_rows;

    [Test]
    [Ignore]
    procedure four_rows;

    [Test]
    [Ignore]
    procedure five_rows;

    [Test]
    [Ignore]
    procedure six_rows;

    [Test]
    [Ignore]
    procedure ten_rows;
  end;

implementation
uses System.SysUtils;

procedure TPascalsTriangleTest.CompareIntMatrices(AExpected, AActual: TArray<TArray<integer>>);
var i, j: integer;
begin
  Assert.AreEqual(Length(AExpected), Length(AActual));
  for i := Low(AExpected) to High(AExpected) do
  begin
    Assert.AreEqual(Length(AExpected[i]), Length(AActual[i]));
    for j := Low(AExpected[i]) to High(AExpected[i]) do
      Assert.AreEqual(AExpected[i, j], AActual[i, j]);
  end;
end;

procedure TPascalsTriangleTest.zero_rows;
var Expected, Actual : TMatrix;
begin
  Expected := [];
  Actual := PascalsTriangle.Calculate(0);
  CompareIntMatrices(Expected, Actual);
end;

procedure TPascalsTriangleTest.single_row;
var Expected, Actual : TMatrix;
begin
  Expected := [[1]];
  Actual := PascalsTriangle.Calculate(1);
  CompareIntMatrices(Expected, Actual);
end;

procedure TPascalsTriangleTest.two_rows;
var Expected, Actual : TMatrix;
begin
  Expected := [[1],
              [1, 1]];
  Actual := PascalsTriangle.Calculate(2);
  CompareIntMatrices(Expected, Actual);
end;

procedure TPascalsTriangleTest.three_rows;
var Expected, Actual : TMatrix;
begin
  Expected := [[1],
              [1, 1],
              [1, 2, 1]];
  Actual := PascalsTriangle.Calculate(3);
  CompareIntMatrices(Expected, Actual);
end;

procedure TPascalsTriangleTest.four_rows;
var Expected, Actual : TMatrix;
begin
  Expected := [[1],
              [1, 1],
              [1, 2, 1],
              [1, 3, 3, 1]];
  Actual := PascalsTriangle.Calculate(4);
  CompareIntMatrices(Expected, Actual);
end;

procedure TPascalsTriangleTest.five_rows;
var Expected, Actual : TMatrix;
begin
  Expected := [[1],
              [1, 1],
              [1, 2, 1],
              [1, 3, 3, 1],
              [1, 4, 6, 4, 1]];
  Actual := PascalsTriangle.Calculate(5);
  CompareIntMatrices(Expected, Actual);
end;

procedure TPascalsTriangleTest.six_rows;
var Expected, Actual : TMatrix;
begin
  Expected := [[1],
              [1, 1],
              [1, 2, 1],
              [1, 3, 3, 1],
              [1, 4, 6, 4, 1],
              [1, 5, 10, 10, 5, 1]];
  Actual := PascalsTriangle.Calculate(6);
  CompareIntMatrices(Expected, Actual);
end;

procedure TPascalsTriangleTest.ten_rows;
var Expected, Actual : TMatrix;
begin
  Expected := [[1],
              [1, 1],
              [1, 2, 1],
              [1, 3, 3, 1],
              [1, 4, 6, 4, 1],
              [1, 5, 10, 10, 5, 1],
              [1, 6, 15, 20 ,15, 6, 1],
              [1, 7, 21, 35, 35, 21, 7, 1],
              [1, 8, 28, 56, 70, 56, 28, 8, 1],
              [1, 9, 36, 84, 126, 126, 84, 36, 9, 1]];
  Actual := PascalsTriangle.Calculate(10);
  CompareIntMatrices(Expected, Actual);
end;

initialization
  TDUnitX.RegisterTestFixture(TPascalsTriangleTest);
end.
