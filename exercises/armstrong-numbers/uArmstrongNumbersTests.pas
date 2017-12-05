unit uArmstrongNumbersTests;

interface
uses
  DUnitX.TestFramework;

const
  CanonicalVersion = '1.0.0';

type

  [TestFixture]
  ArmstrongNumbersTests = class(TObject) 
  public
    [Test]
//    [Ignore('Comment the "[Ignore]" statement to run the test')]
    procedure Single_digit_numbers_are_Armstrong_numbers;

    [Test]
    [Ignore]
    procedure There_are_no_2_digit_Armstrong_numbers;

    [Test]
    [Ignore]
    procedure Three_digit_number_that_is_an_Armstrong_number;

    [Test]
    [Ignore]
    procedure Three_digit_number_that_is_not_an_Armstrong_number;

    [Test]
    [Ignore]
    procedure Four_digit_number_that_is_an_Armstrong_number;

    [Test]
    [Ignore]
    procedure Four_digit_number_that_is_not_an_Armstrong_number;

    [Test]
    [Ignore]
    procedure Seven_digit_number_that_is_an_Armstrong_number;

    [Test]
    [Ignore]
    procedure Seven_digit_number_that_is_not_an_Armstrong_number;
  end;

implementation
uses uArmstrongNumbers;

{ ArmstrongNumbersTests }

procedure ArmstrongNumbersTests.Four_digit_number_that_is_an_Armstrong_number;
begin
  Assert.IsTrue(isArmstrongNumber(9474));
end;

procedure ArmstrongNumbersTests.Four_digit_number_that_is_not_an_Armstrong_number;
begin
  Assert.IsFalse(isArmstrongNumber(9475));
end;

procedure ArmstrongNumbersTests.Seven_digit_number_that_is_an_Armstrong_number;
begin
  Assert.IsTrue(isArmstrongNumber(9926315));
end;

procedure ArmstrongNumbersTests.Seven_digit_number_that_is_not_an_Armstrong_number;
begin
  Assert.IsFalse(isArmstrongNumber(9926314));
end;

procedure ArmstrongNumbersTests.Single_digit_numbers_are_Armstrong_numbers;
var
  i: integer;
begin
  for i := 0 to 9 do
    Assert.IsTrue(isArmstrongNumber(i));
end;

procedure ArmstrongNumbersTests.There_are_no_2_digit_Armstrong_numbers;
var
  i: integer;
begin
  for i := 10 to 99 do
    Assert.IsFalse(isArmstrongNumber(i));
end;

procedure ArmstrongNumbersTests.Three_digit_number_that_is_an_Armstrong_number;
begin
  Assert.IsTrue(isArmstrongNumber(153));
end;

procedure ArmstrongNumbersTests.Three_digit_number_that_is_not_an_Armstrong_number;
begin
  Assert.IsFalse(isArmstrongNumber(100));
end;

initialization
  TDUnitX.RegisterTestFixture(ArmstrongNumbersTests);
end.
