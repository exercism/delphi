unit uDartsTests;

interface
uses
  DUnitX.TestFramework;

const
  CanonicalVersion = '1.2.0.1';

type
  [TestFixture('Return the correct amount earned by a dart landing in a given point in the target problem.')]
  TDartsTest = class(TObject)
  public
    [Test]
//    [Ignore('Comment the "[Ignore]" statement to run the test')]
    procedure ADartLandsOutsideTheTarget;

    [Test]
    [Ignore]
    procedure ADartLandsJustInTheBorderOfTheTarget;

    [Test]
    [Ignore]
    procedure ADartLandsInTheOuterCircle;

    [Test]
    [Ignore]
    procedure ADartLandsRightInTheBorderBetweenOutsideAndMiddleCircles;

    [Test]
    [Ignore]
    procedure ADartLandsInTheMiddleCircle;

    [Test]
    [Ignore]
    procedure ADartLandsRightInTheBorderBetweenMiddleAndInnerCircles;

    [Test]
    [Ignore]
    procedure ADartLandsInTheInnerCircle;

    [Test]
    [Ignore]
    procedure ADartWhoseCoordinatesSumToGreaterThanOneButWhoseRadiusToOriginIsLessThanOrEqualToOneIsScoredInTheInnerCircle;

    [Test]
    [Ignore]
    procedure ADartWhoseCoordinatesSumToGreaterThanFiveButWhoseRadiusToOriginIsLessThanOrEqualToFiveIsScoredInTheMiddleCircle;

    [Test]
    [Ignore]
    procedure ADartWhoseCoordinatesSumToGreaterThanTenButWhoseRadiusToOriginIsLessThanOrEqualTenIsScoredInTheOuterCircle;
  end;

implementation

uses
  uDarts;

procedure TDartsTest.ADartLandsInTheInnerCircle;
begin
  Assert.AreEqual(10, TDarts.Score(-0.1, -0.1));
end;

procedure TDartsTest.ADartLandsInTheMiddleCircle;
begin
  Assert.AreEqual(5, TDarts.Score(0.8, -0.8));
end;

procedure TDartsTest.ADartLandsInTheOuterCircle;
begin
  Assert.AreEqual(1, TDarts.Score(4, 4));
end;

procedure TDartsTest.ADartLandsJustInTheBorderOfTheTarget;
begin
  Assert.AreEqual(1, TDarts.Score(0, 10));
end;

procedure TDartsTest.ADartLandsOutsideTheTarget;
begin
  Assert.AreEqual(0, TDarts.Score(-9, 9));
end;

procedure TDartsTest.ADartLandsRightInTheBorderBetweenMiddleAndInnerCircles;
begin
  Assert.AreEqual(10, TDarts.Score(0, -1));
end;

procedure TDartsTest.ADartLandsRightInTheBorderBetweenOutsideAndMiddleCircles;
begin
  Assert.AreEqual(5, TDarts.Score(5, 0));
end;

procedure TDartsTest.ADartWhoseCoordinatesSumToGreaterThanFiveButWhoseRadiusToOriginIsLessThanOrEqualToFiveIsScoredInTheMiddleCircle;
begin
  Assert.AreEqual(5, TDarts.Score(2, 4));
end;

procedure TDartsTest.ADartWhoseCoordinatesSumToGreaterThanOneButWhoseRadiusToOriginIsLessThanOrEqualToOneIsScoredInTheInnerCircle;
begin
  Assert.AreEqual(10, TDarts.Score(0.4, 0.8));
end;

procedure TDartsTest.ADartWhoseCoordinatesSumToGreaterThanTenButWhoseRadiusToOriginIsLessThanOrEqualTenIsScoredInTheOuterCircle;
begin
  Assert.AreEqual(1, TDarts.Score(4, 8));
end;

initialization
  TDUnitX.RegisterTestFixture(TDartsTest);
end.
