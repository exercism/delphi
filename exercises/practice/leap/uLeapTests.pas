unit uLeapTests;

interface
uses
  DUnitX.TestFramework;

const
  CanonicalVersion = '1.5.0';

type

  [TestFixture]
  YearTest = class(TObject)
  public
    [Test]
//    [Ignore('Comment the "[Ignore]" statement to run the test')]
    procedure year_not_divisible_by_4_common_year;

    [Test]
    [Ignore]
    procedure year_divisible_by_2_not_divisible_by_4_common_year;
    
    [Test]
    [Ignore]
    procedure year_divisible_by_4_not_divisible_by_100_leap_year;

    [Test]
    [Ignore]
    procedure year_divisible_by_100_not_divisible_by_400_common_year;

    [Test]
    [Ignore]
    procedure year_divisible_by_400_leap_year;

    [Test]
    [Ignore]
    procedure year_divisible_by_200_not_divisible_by_400_common_year;
  end;

implementation
uses uLeap;

procedure YearTest.year_not_divisible_by_4_common_year;
begin
  assert.IsFalse(TYear.IsLeap(2015), 'Expected ''false'', 2015 is not a leap year.');
end;

procedure YearTest.year_divisible_by_4_not_divisible_by_100_leap_year;
begin
  assert.IsTrue(TYear.IsLeap(1996), 'Expected ''true'', 1996 is a leap year.');
end;

procedure YearTest.year_divisible_by_100_not_divisible_by_400_common_year;
begin
  assert.IsFalse(TYear.IsLeap(2100), 'Expected ''false'', 2100 is not a leap year.');
end;

procedure YearTest.year_divisible_by_200_not_divisible_by_400_common_year;
begin
  assert.IsFalse(TYear.IsLeap(1800), 'Expected ''false'', 1800 is not a leap year.');
end;

procedure YearTest.year_divisible_by_2_not_divisible_by_4_common_year;
begin
  assert.IsFalse(TYear.IsLeap(1970), 'Expected ''false'', 1970 is not a leap year.');
end;

procedure YearTest.year_divisible_by_400_leap_year;
begin
  assert.IsTrue(TYear.IsLeap(2000), 'Expected ''true'', 2000 is a leap year.');
end;

initialization
  TDUnitX.RegisterTestFixture(YearTest);
end.
