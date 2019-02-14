unit uResistorColorTests;

interface
uses
  DUnitX.TestFramework, uResistor;

type

  [TestFixture('Color Codes')]
  TTestResistorColor = class(TObject)
  public
    [Test]
//    [Ignore('Comment the "[Ignore]" statement to run the test')]
    procedure Black;

    [Test]
    [Ignore]
    procedure White;

    [Test]
    [Ignore]
    procedure Orange;
  end;

  [TestFixture('Colors')]
  TTestColors = class(TObject)
  private
    procedure CompareDynamicArrays(aExpected, aActual: TArray<TResistorColors>);
  public
    [Test]
    [Ignore]
    procedure Colors;
  end;

implementation

{ TTestResistorColor }

procedure TTestResistorColor.Black;
begin
  Assert.AreEqual(0, TResistor.colorCode(rcBlack));
end;

procedure TTestResistorColor.White;
begin
  Assert.AreEqual(9, TResistor.colorCode(rcWhite));
end;

procedure TTestResistorColor.Orange;
begin
  Assert.AreEqual(3, TResistor.colorCode(rcOrange));
end;

{ TTestColors }

procedure TTestColors.Colors;
var
  Expected: TArray<TResistorColors>;
  Actual: TArray<TResistorColors>;
begin
  Expected := [rcBlack, rcBrown, rcRed, rcOrange, rcYellow, rcGreen, rcBlue,
    rcViolet, rcGrey, rcWhite];

  Actual := TResistor.colors;

  CompareDynamicArrays(Expected, Actual);
end;

procedure TTestColors.CompareDynamicArrays(aExpected, aActual: TArray<TResistorColors>);
var
  i: integer;
begin
  Assert.AreEqual(length(aExpected), length(aActual));
  for i := Low(aExpected) to High(aExpected) do
    Assert.AreEqual(aExpected[i], aActual[i]);
end;

initialization
  TDUnitX.RegisterTestFixture(TTestResistorColor);
  TDUnitX.RegisterTestFixture(TTestColors);
end.
