unit uDifferenceOfSquaresTests;

interface
uses
  DUnitX.TestFramework;

const
  CanonicalVersion = '1.2.0';

type

  [TestFixture('Square the sum of the numbers up to the given number')]
  SquareSumTests = class(TObject)
  public
    [Test]
//    [Ignore('Comment the "[Ignore]" statement to run the test')]
    procedure square_of_sum_1;

    [Test]
    [Ignore]
    procedure square_of_sum_5;

    [Test]
    [Ignore]
    procedure square_of_sum_100;
  end;

  [TestFixture('Sum the squares of the numbers up to the given number')]
  SumTheSquaresTests = class(TObject)
  public
    [Test]
    [Ignore]
    procedure sum_of_squares_1;

    [Test]
    [Ignore]
    procedure sum_of_squares_5;

    [Test]
    [Ignore]
    procedure sum_of_squares_100;
  end;

  [TestFixture('Subtract sum of squares from square of sums')]
  SubtractSumOfSquaresFromSquareOfSumsTests = class(TObject)
  public
    [Test]
    [Ignore]
    procedure difference_of_squares_1;

    [Test]
    [Ignore]
    procedure difference_of_squares_5;

    [Test]
    [Ignore]
    procedure difference_of_squares_100;
  end;

implementation
uses SysUtils, uDifferenceOfSquares;

{ SquareSumTests }

procedure SquareSumTests.square_of_sum_1;
begin
  Assert.AreEqual(1, squareOfSum(1));
end;

procedure SquareSumTests.square_of_sum_100;
begin
  Assert.AreEqual(25502500, squareOfSum(100));
end;

procedure SquareSumTests.square_of_sum_5;
begin
  Assert.AreEqual(225, squareOfSum(5));
end;

{ SumTheSquaresTests }

procedure SumTheSquaresTests.sum_of_squares_1;
begin
  Assert.AreEqual(1, sumOfSquares(1));
end;

procedure SumTheSquaresTests.sum_of_squares_100;
begin
  Assert.AreEqual(338350, sumOfSquares(100));
end;

procedure SumTheSquaresTests.sum_of_squares_5;
begin
  Assert.AreEqual(55, sumOfSquares(5));
end;

{ SubtractSumOfSquaresFromSquareOfSumsTests }

procedure SubtractSumOfSquaresFromSquareOfSumsTests.difference_of_squares_1;
begin
  Assert.AreEqual(0, differenceOfSquares(1));
end;

procedure SubtractSumOfSquaresFromSquareOfSumsTests.difference_of_squares_100;
begin
  Assert.AreEqual(25164150, differenceOfSquares(100));
end;

procedure SubtractSumOfSquaresFromSquareOfSumsTests.difference_of_squares_5;
begin
  Assert.AreEqual(170, differenceOfSquares(5));
end;

initialization
  TDUnitX.RegisterTestFixture(SquareSumTests);
  TDUnitX.RegisterTestFixture(SumTheSquaresTests);
  TDUnitX.RegisterTestFixture(SubtractSumOfSquaresFromSquareOfSumsTests);
end.
