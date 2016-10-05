unit uLeapTests;

interface
uses
  DUnitX.TestFramework;

type

  [TestFixture]
  YearTest = class(TObject)
  public
    [Test]
    [Ignore]
    procedure test_leap_year;

    [Test]
    [Ignore]
    procedure test_standard_and_odd_year;

    [Test]
    [Ignore]
    procedure test_standard_even_year;

    [Test]
    [Ignore]
    procedure test_standard_nineteenth_century;

    [Test]
    [Ignore]
    procedure test_standard_eighteenth_century;

    [Test]
    [Ignore]
    procedure test_leap_twenty_fourth_century;

    [Test]
    [Ignore]
    procedure test_leap_y2k;
  end;

implementation
uses uLeap;

procedure YearTest.test_leap_year;
begin
  assert.IsTrue(TYear.IsLeap(1996), 'Expected ''true'', 1996 is a leap year.');
end;

procedure YearTest.test_standard_and_odd_year;
begin
  assert.IsFalse(TYear.IsLeap(1997), 'Expected ''false'', 1997 is not a leap year.');
end;

procedure YearTest.test_standard_even_year;
begin
  assert.IsFalse(TYear.IsLeap(1998), 'Expected ''false'', 1998 is not a leap year.');
end;

procedure YearTest.test_standard_nineteenth_century;
begin
  assert.IsFalse(TYear.IsLeap(1900), 'Expected ''false'', 1900 is not a leap year.');
end;

procedure YearTest.test_standard_eighteenth_century;
begin
  assert.IsFalse(TYear.IsLeap(1800), 'Expected ''false'', 1800 is not a leap year.');
end;

procedure YearTest.test_leap_twenty_fourth_century;
begin
  assert.IsTrue(TYear.IsLeap(2400), 'Expected ''true'', 2400 is a leap year.');
end;

procedure YearTest.test_leap_y2k;
begin
  assert.IsTrue(TYear.IsLeap(2000), 'Expected ''true'', 2000 is a leap year.');
end;

initialization
  TDUnitX.RegisterTestFixture(YearTest);
end.
