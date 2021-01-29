unit uResistorColorTests;

interface
uses
  DUnitX.TestFramework;

const
  CanonicalVersion = '1.0.0';

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
  public
    [Test]
    [Ignore]
    procedure Colors;
  end;

implementation
uses
  uResistorColor;

type
  Assert = class(DUnitX.TestFramework.Assert)
    class procedure AreEqual(Expected, Actual: TArray<string>); overload;
  end;

{ TTestResistorColor }

procedure TTestResistorColor.Black;
begin
  Assert.AreEqual(0, TResistor.colorCode('black'));
end;

procedure TTestResistorColor.White;
begin
  Assert.AreEqual(9, TResistor.colorCode('white'));
end;

procedure TTestResistorColor.Orange;
begin
  Assert.AreEqual(3, TResistor.colorCode('orange'));
end;

{ TTestColors }

procedure TTestColors.Colors;
var
  Expected: TArray<string>;
begin
  Expected := ['black', 'brown', 'red', 'orange', 'yellow', 'green', 'blue',
    'violet', 'grey', 'white'];

  Assert.AreEqual(Expected, TResistor.colors);
end;

{ Assert }

class procedure Assert.AreEqual(Expected, Actual: TArray<string>);
var
  i: integer;
begin
  Assert.AreEqual(length(Expected), length(Actual));
  for i := Low(Expected) to High(Expected) do
    Assert.AreEqual(Expected[i], Actual[i]);
end;

initialization
  TDUnitX.RegisterTestFixture(TTestResistorColor);
  TDUnitX.RegisterTestFixture(TTestColors);
end.
