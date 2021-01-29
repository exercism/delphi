unit uRationalNumbersTests;

interface
uses
  DUnitX.TestFramework;

const
  CanonicalVersion = '1.1.0.2';

type

  [TestFixture('Addition')]
  TAdditionTests = class(TObject)
  public
    [Test]
//    [Ignore('Comment the "[Ignore]" statement to run the test')]
    procedure AddTwoPositiveRationalNumbers;

    [Test]
    [Ignore]
    procedure AddAPositiveRationalNumberAndANegativeRationalNumber;

    [Test]
    [Ignore]
    procedure AddTwoNegativeRationalNumbers;

    [Test]
    [Ignore]
    procedure AddARationalNumberToItsAdditiveInverse;
  end;

  [TestFixture('Subtraction')]
  TSubtractionTests = class(TObject)
  public
    [Test]
    [Ignore]
    procedure SubtractTwoPositiveRationalNumbers;

    [Test]
    [Ignore]
    procedure SubtractAPositiveRationalNumberAndANegativeRationalNumber;

    [Test]
    [Ignore]
    procedure SubtractTwoNegativeRationalNumbers;

    [Test]
    [Ignore]
    procedure SubtractARationalNumberFromItself;
  end;

  [TestFixture('Multiplication')]
  TMultiplicationTests = class(TObject)
  public
    [Test]
    [Ignore]
    procedure MultiplyTwoPositiveRationalNumbers;

    [Test]
    [Ignore]
    procedure MultiplyANegativeRationalNumberByAPositiveRationalNumber;

    [Test]
    [Ignore]
    procedure MultiplyTwoNegativeRationalNumbers;

    [Test]
    [Ignore]
    procedure MultiplyARationalNumberByItsReciprocal;

    [Test]
    [Ignore]
    procedure MultiplyARationalNumberByOne;

    [Test]
    [Ignore]
    procedure MultiplyARationalNumberByZero;
  end;

  [TestFixture('Division')]
  TDivisionTests = class(TObject)
  public
    [Test]
    [Ignore]
    procedure DivideTwoPositiveRationalNumbers;

    [Test]
    [Ignore]
    procedure DivideAPositiveRationalNumberByANegativeRationalNumber;

    [Test]
    [Ignore]
    procedure DivideTwoNegativeRationalNumbers;

    [Test]
    [Ignore]
    procedure DivideARationalNumberByOne;

    [Test]
    [Ignore]
    procedure DivideAWholeNumberByARationalNumber;
  end;

  [TestFixture('Absolute value')]
  TAbsoluteValueTests = class(TObject)
  public
    [Test]
    [Ignore]
    procedure AbsoluteValueOfAPositiveRationalNumber;

    [Test]
    [Ignore]
    procedure AbsoluteValueOfAPositiveRationalNumberWithNegativeNumeratorAndDenominator;

    [Test]
    [Ignore]
    procedure AbsoluteValueOfANegativeRationalNumber;

    [Test]
    [Ignore]
    procedure AbsoluteValueOfANegativeRationalNumberWithNegativeDenominator;

    [Test]
    [Ignore]
    procedure AbsoluteValueOfZero;
  end;

  [TestFixture('Exponentiation of a rational number')]
  TExpoRationalNumberTests = class(TObject)
  public
    [Test]
    [Ignore]
    procedure RaiseAPositiveRationalNumberToAPositiveIntegerPower;

    [Test]
    [Ignore]
    procedure RaiseANegativeRationalNumberToAPositiveIntegerPower;

    [Test]
    [Ignore]
    procedure RaiseZeroToAnIntegerPower;

    [Test]
    [Ignore]
    procedure RaiseOneToAnIntegerPower;

    [Test]
    [Ignore]
    procedure RaiseAPositiveRationalNumberToThePowerOfZero;

    [Test]
    [Ignore]
    procedure RaiseANegativeRationalNumberToThePowerOfZero;
  end;

  [TestFixture('Exponentiation of a real number to a rational number')]
  TExpoRealToRatNumber = class(TObject)
  public
    [Test]
    [Ignore]
    procedure RaiseARealNumberToAPositiveRationalNumber;

    [Test]
    [Ignore]
    procedure RaiseARealNumberToANegativeRationalNumber;

    [Test]
    [Ignore]
    procedure RaiseARealNumberToAZeroRationalNumber;
  end;

  [TestFixture('Reduction to lowest terms')]
  TReduceTests = class(TObject)
  public
    [Test]
    [Ignore]
    procedure ReduceAPositiveRationalNumberToLowestTerms;

    [Test]
    [Ignore]
    procedure ReduceANegativeRationalNumberToLowestTerms;

    [Test]
    [Ignore]
    procedure ReduceARationalNumberWithANegativeDenominatorToLowestTerms;

    [Test]
    [Ignore]
    procedure ReduceZeroToLowestTerms;

    [Test]
    [Ignore]
    procedure ReduceAnIntegerToLowestTerms;

    [Test]
    [Ignore]
    procedure ReduceOneToLowestTerms;
  end;

implementation
uses
  System.Math, uRationalNumbers;


{$region 'TAdditionTests'}

procedure TAdditionTests.AddAPositiveRationalNumberAndANegativeRationalNumber;
var
  LPositiveRationalValue: TFraction;
  LNegativeRationalValue: TFraction;
  Expected: string;
  Actual: TFraction;
begin
  Expected := '-1/6';
  LPositiveRationalValue := TFraction.CreateFrom(1, 2);
  LNegativeRationalValue := TFraction.CreateFrom(2, 3);
  Actual := LPositiveRationalValue + -LNegativeRationalValue;
  Assert.AreEqual(Expected, string(Actual));
end;

procedure TAdditionTests.AddARationalNumberToItsAdditiveInverse;
var
  LRationalNumber: TFraction;
  Actual: TFraction;
  Expected: string;
begin
  Expected := '0/1';
  LRationalNumber := TFraction.CreateFrom(1, 2);
  Actual := LRationalNumber + -LRationalNumber;
  Assert.AreEqual(Expected, string(actual));
end;

procedure TAdditionTests.AddTwoNegativeRationalNumbers;
var
  lNegFracA: TFraction;
  lNegFracB: TFraction;
  Actual: TFraction;
  Expected: string;
begin
  Expected := '-7/6';
  LNegFracA := TFraction.CreateFrom(-1, 2);
  LNegFracB := TFraction.CreateFrom(-2 ,3);
  Actual := LNegFracA + LNegFracB;
  Assert.AreEqual(Expected, string(actual));
end;

procedure TAdditionTests.AddTwoPositiveRationalNumbers;
var
  lPosFracA: TFraction;
  lPosFracB: TFraction;
  Actual: TFraction;
  Expected: string;
begin
  Expected := '7/6';
  LPosFracA := TFraction.CreateFrom(1, 2);
  LPosFracB := TFraction.CreateFrom(2 ,3);
  Actual := LPosFracA + LPosFracB;
  Assert.AreEqual(Expected, string(actual));
end;
{$endregion}

{$region 'TSubtractionTests'}

procedure TSubtractionTests.SubtractAPositiveRationalNumberAndANegativeRationalNumber;
var
  LPosRatNum: TFraction;
  LNegRatNum: TFraction;
  Actual: TFraction;
  Expected: string;
begin
  Expected := '7/6';
  LPosRatNum := TFraction.CreateFrom(1, 2);
  LNegRatNum := TFraction.CreateFrom(-2, 3);
  Actual := LPosRatNum - LNegRatNum;
  Assert.AreEqual(Expected, string(Actual));
end;

procedure TSubtractionTests.SubtractARationalNumberFromItself;
var
  LRatNum: TFraction;
  Actual: TFraction;
  Expected: string;
begin
  Expected := '0/1';
  LRatNum := TFraction.CreateFrom(1, 2);
  Actual := LRatNum - LRatNum;
  Assert.AreEqual(Expected, string(Actual));
end;

procedure TSubtractionTests.SubtractTwoNegativeRationalNumbers;
var
  LNegRatNumA: TFraction;
  LNegRatNumB: TFraction;
  Actual: TFraction;
  Expected: string;
begin
  Expected := '1/6';
  LNegRatNumA := TFraction.CreateFrom(-1, 2);
  LNegRatNumB := TFraction.CreateFrom(-2, 3);
  Actual := LNegRatNumA - LNegRatNumB;
  Assert.AreEqual(Expected, string(Actual));
end;

procedure TSubtractionTests.SubtractTwoPositiveRationalNumbers;
var
  LPosRatNumA: TFraction;
  LPosRatNumB: TFraction;
  Actual: TFraction;
  Expected: string;
begin
  Expected := '-1/6';
  LPosRatNumA := TFraction.CreateFrom(1, 2);
  LPosRatNumB := TFraction.CreateFrom(2, 3);
  Actual := LPosRatNumA - LPosRatNumB;
  Assert.AreEqual(Expected, string(Actual));
end;
{$endregion}

{$region 'TMultiplicationTests'}

procedure TMultiplicationTests.MultiplyANegativeRationalNumberByAPositiveRationalNumber;
var
  LNegRatA: TFraction;
  LPosRatB: TFraction;
  Actual: TFraction;
  Expected: string;
begin
  Expected := '-1/3';
  LNegRatA := TFraction.CreateFrom(-1, 2);
  LPosRatB := TFraction.CreateFrom(2, 3);
  Actual := LNegRatA * LPosRatB;
  Assert.AreEqual(Expected, string(Actual));
end;

procedure TMultiplicationTests.MultiplyARationalNumberByItsReciprocal;
var
  LRatNum: TFraction;
  Actual: TFraction;
  Expected: string;
begin
  Expected := '1/1';
  LRatNum := TFraction.CreateFrom(1, 2);
  Actual := LRatNum * (1 / LRatNum);
  Assert.AreEqual(Expected, string(Actual));
end;

procedure TMultiplicationTests.MultiplyARationalNumberByOne;
var
  LRatNum: TFraction;
  Actual: TFraction;
  Expected: string;
begin
  Expected := '1/2';
  LRatNum := TFraction.CreateFrom(1, 2);
  Actual := LRatNum * 1;
  Assert.AreEqual(Expected, string(Actual));
end;

procedure TMultiplicationTests.MultiplyARationalNumberByZero;
var
  LRatNum: TFraction;
  Actual: TFraction;
  Expected: string;
begin
  Expected := '0/1';
  LRatNum := TFraction.CreateFrom(1, 2);
  Actual := LRatNum * 0;
  Assert.AreEqual(Expected, string(Actual));
end;

procedure TMultiplicationTests.MultiplyTwoNegativeRationalNumbers;
var
  LNegRatA: TFraction;
  LNegRatB: TFraction;
  Actual: TFraction;
  Expected: string;
begin
  Expected := '1/3';
  LNegRatA := TFraction.CreateFrom(-1, 2);
  LNegRatB := TFraction.CreateFrom(-2, 3);
  Actual := LNegRatA * LNegRatB;
  Assert.AreEqual(Expected, string(Actual));
end;

procedure TMultiplicationTests.MultiplyTwoPositiveRationalNumbers;
var
  LPosRatA: TFraction;
  LPosRatB: TFraction;
  Actual: TFraction;
  Expected: string;
begin
  Expected := '1/3';
  LPosRatA := TFraction.CreateFrom(1, 2);
  LPosRatB := TFraction.CreateFrom(2, 3);
  Actual := LPosRatA * LPosRatB;
  Assert.AreEqual(Expected, string(Actual));
end;
{$endregion}

{$region 'TDivisionTests'}

procedure TDivisionTests.DivideAPositiveRationalNumberByANegativeRationalNumber;
var
  LPosRatA: TFraction;
  LNegRatB: TFraction;
  Actual: TFraction;
  Expected: string;
begin
  Expected := '-3/4';
  LPosRatA := TFraction.CreateFrom(1, 2);
  LNegRatB := TFraction.CreateFrom(-2, 3);
  Actual := LPosRatA / LNegRatB;
  Assert.AreEqual(Expected, string(Actual));
end;

procedure TDivisionTests.DivideARationalNumberByOne;
var
  LRatNum: TFraction;
  Actual: TFraction;
  Expected: string;
begin
  Expected := '1/2';
  LRatNum := TFraction.CreateFrom(1, 2);
  Actual := LRatNum / 1;
  Assert.AreEqual(Expected, string(Actual));
end;

procedure TDivisionTests.DivideAWholeNumberByARationalNumber;
var
  LRatNum: TFraction;
  Actual: TFraction;
  Expected: string;
begin
  Expected := '14/1';
  LRatNum := TFraction.CreateFrom(2, 7);
  Actual := 4 / LRatNum;
  Assert.AreEqual(Expected, string(Actual));
end;

procedure TDivisionTests.DivideTwoNegativeRationalNumbers;
var
  LNegRatA: TFraction;
  LNegRatB: TFraction;
  Actual: TFraction;
  Expected: string;
begin
  Expected := '3/4';
  LNegRatA := TFraction.CreateFrom(-1, 2);
  LNegRatB := TFraction.CreateFrom(-2, 3);
  Actual := LNegRatA / LNegRatB;
  Assert.AreEqual(Expected, string(Actual));
end;

procedure TDivisionTests.DivideTwoPositiveRationalNumbers;
var
  LPosRatA: TFraction;
  LPosRatB: TFraction;
  Actual: TFraction;
  Expected: string;
begin
  Expected := '3/4';
  LPosRatA := TFraction.CreateFrom(1, 2);
  LPosRatB := TFraction.CreateFrom(2, 3);
  Actual := LPosRatA / LPosRatB;
  Assert.AreEqual(Expected, string(Actual));
end;
{$endregion}

{$region 'TAbsoluteValueTests'}

procedure TAbsoluteValueTests.AbsoluteValueOfANegativeRationalNumber;
var
  LNegRatNum: TFraction;
  Actual: TFraction;
  Expected: string;
begin
  Expected := '1/2';
  LNegRatNum := TFraction.CreateFrom(-1, 2);
  Actual := TFraction(Abs(LNegRatNum));
  Assert.AreEqual(Expected, string(Actual));
end;

procedure TAbsoluteValueTests.AbsoluteValueOfANegativeRationalNumberWithNegativeDenominator;
var
  LNegRatNum: TFraction;
  Actual: TFraction;
  Expected: string;
begin
  Expected := '1/2';
  LNegRatNum := TFraction.CreateFrom(1, -2);
  Actual := TFraction(Abs(LNegRatNum));
  Assert.AreEqual(Expected, string(Actual));
end;

procedure TAbsoluteValueTests.AbsoluteValueOfAPositiveRationalNumber;
var
  LPosRatNum: TFraction;
  Actual: TFraction;
  Expected: string;
begin
  Expected := '1/2';
  LPosRatNum := TFraction.CreateFrom(1, 2);
  Actual := TFraction(Abs(LPosRatNum));
  Assert.AreEqual(Expected, string(Actual));
end;

procedure TAbsoluteValueTests.AbsoluteValueOfAPositiveRationalNumberWithNegativeNumeratorAndDenominator;
var
  LNegRatNum: TFraction;
  Actual: TFraction;
  Expected: string;
begin
  Expected := '1/2';
  LNegRatNum := TFraction.CreateFrom(-1, -2);
  Actual := TFraction(Abs(LNegRatNum));
  Assert.AreEqual(Expected, string(Actual));
end;

procedure TAbsoluteValueTests.AbsoluteValueOfZero;
var
  LZero: TFraction;
  Actual: TFraction;
  Expected: string;
begin
  Expected := '0/1';
  LZero := TFraction.CreateFrom(0, 1);
  Actual := TFraction(Abs(LZero));
  Assert.AreEqual(Expected, string(Actual));
end;
{$endregion}

{$region 'TExpoRationalNumberTests'}

procedure TExpoRationalNumberTests.RaiseANegativeRationalNumberToAPositiveIntegerPower;
var
  NegRatNum: TFraction;
  Actual: TFraction;
  Expected: string;
begin
  Expected := '-1/8';
  NegRatNum := TFraction.CreateFrom(-1, 2);
  Actual := TFraction(System.Math.Power(NegRatNum,3));
  Assert.AreEqual(Expected, string(Actual));
end;

procedure TExpoRationalNumberTests.RaiseANegativeRationalNumberToThePowerOfZero;
var
  NegRatNum: TFraction;
  Actual: TFraction;
  Expected: string;
begin
  Expected := '1/1';
  NegRatNum := TFraction.CreateFrom(-1, 2);
  Actual := TFraction(System.Math.Power(NegRatNum,0));
  Assert.AreEqual(Expected, string(Actual));
end;

procedure TExpoRationalNumberTests.RaiseAPositiveRationalNumberToAPositiveIntegerPower;
var
  PosRatNum: TFraction;
  Actual: TFraction;
  Expected: string;
begin
  Expected := '1/8';
  PosRatNum := TFraction.CreateFrom(1, 2);
  Actual := TFraction(System.Math.Power(PosRatNum, 3));
  Assert.AreEqual(Expected, string(Actual));
end;

procedure TExpoRationalNumberTests.RaiseAPositiveRationalNumberToThePowerOfZero;
var
  PosRatNum: TFraction;
  Actual: TFraction;
  Expected: string;
begin
  Expected := '1/1';
  PosRatNum := TFraction.CreateFrom(1, 2);
  Actual := TFraction(System.Math.Power(PosRatNum, 0));
  Assert.AreEqual(Expected, string(Actual));
end;

procedure TExpoRationalNumberTests.RaiseOneToAnIntegerPower;
var
  Actual: TFraction;
  Expected: string;
begin
  Expected := '1/1';
  Actual := TFraction(System.Math.Power(1, 4));
  Assert.AreEqual(Expected, string(Actual));
end;

procedure TExpoRationalNumberTests.RaiseZeroToAnIntegerPower;
var
  Actual: TFraction;
  Expected: string;
begin
  Expected := '0/1';
  Actual := TFraction(System.Math.Power(0, 5));
  Assert.AreEqual(Expected, string(Actual));
end;
{$endregion}

{$region 'TExpoRealToRatNumber'}

procedure TExpoRealToRatNumber.RaiseARealNumberToANegativeRationalNumber;
var
  NegRatNum: TFraction;
  Actual: Double;
  Expected: Double;
begin
  Expected := 1 / 3;
  NegRatNum := TFraction.CreateFrom(-1, 2);
  Actual := System.Math.Power(9, NegRatNum);
  Assert.AreEqual(Expected, Actual);
end;

procedure TExpoRealToRatNumber.RaiseARealNumberToAPositiveRationalNumber;
var
  PosRatNum: TFraction;
  Actual: Double;
  Expected: Double;
begin
  Expected := 16.0;
  PosRatNum := TFraction.CreateFrom(4, 3);
  Actual := System.Math.Power(8, PosRatNum);
  Assert.AreEqual(Expected, Actual);
end;

procedure TExpoRealToRatNumber.RaiseARealNumberToAZeroRationalNumber;
var
  ZeroRatNum: TFraction;
  Actual: Double;
  Expected: Double;
begin
  Expected := 1.0;
  ZeroRatNum := TFraction.CreateFrom(0, 1);
  Actual := System.Math.Power(2, ZeroRatNum);
  Assert.AreEqual(Expected, Actual);
end;
{$endregion}

{$region 'TReduceTests'}

procedure TReduceTests.ReduceANegativeRationalNumberToLowestTerms;
var
  Actual: TFraction;
  Expected: string;
begin
  Expected := '-2/3';
  Actual := TFraction.CreateFrom(-4, 6).Reduced;
  Assert.AreEqual(Expected, string(Actual));
end;

procedure TReduceTests.ReduceAnIntegerToLowestTerms;
var
  Actual: TFraction;
  Expected: string;
begin
  Expected := '-2/1';
  Actual := TFraction.CreateFrom(-14, 7).Reduced;
  Assert.AreEqual(Expected, string(Actual));
end;

procedure TReduceTests.ReduceAPositiveRationalNumberToLowestTerms;
var
  Actual: TFraction;
  Expected: string;
begin
  Expected := '1/2';
  Actual := TFraction.CreateFrom(2, 4).Reduced;
  Assert.AreEqual(Expected, string(Actual));
end;

procedure TReduceTests.ReduceARationalNumberWithANegativeDenominatorToLowestTerms;
var
  Actual: TFraction;
  Expected: string;
begin
  Expected := '-1/3';
  Actual := TFraction.CreateFrom(3, -9).Reduced;
  Assert.AreEqual(Expected, string(Actual));
end;

procedure TReduceTests.ReduceOneToLowestTerms;
var
  Actual: TFraction;
  Expected: string;
begin
  Expected := '1/1';
  Actual := TFraction.CreateFrom(13, 13).Reduced;
  Assert.AreEqual(Expected, string(Actual));
end;

procedure TReduceTests.ReduceZeroToLowestTerms;
var
  Actual: TFraction;
  Expected: string;
begin
  Expected := '0/1';
  Actual := TFraction.CreateFrom(0, 6).Reduced;
  Assert.AreEqual(Expected, string(Actual));
end;
{$endregion}

initialization
  TDUnitX.RegisterTestFixture(TAdditionTests);
  TDUnitX.RegisterTestFixture(TSubtractionTests);
  TDUnitX.RegisterTestFixture(TMultiplicationTests);
  TDUnitX.RegisterTestFixture(TDivisionTests);
  TDUnitX.RegisterTestFixture(TAbsoluteValueTests);
  TDUnitX.RegisterTestFixture(TExpoRationalNumberTests);
  TDUnitX.RegisterTestFixture(TExpoRealToRatNumber);
  TDUnitX.RegisterTestFixture(TReduceTests);
end.
