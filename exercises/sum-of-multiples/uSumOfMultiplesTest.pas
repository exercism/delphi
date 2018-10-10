unit uSumOfMultiplesTest;

interface
uses
  DUnitX.TestFramework, uSumsOfMultiples;

const
  CanonicalVersion = '1.3.0';

type
  [TestFixture]
  TSumsOfMultipleTest = class(TObject)
  public
    [Test]
//  [Ignore('Comment the "[Ignore]" statement to run the test')]
    procedure multiples_of_3_or_5_up_to_1;

    [Test]
    [Ignore]
    procedure multiples_of_3_or_5_up_to_4;

    [Test]
    [Ignore]
    procedure multiples_of_3_up_to_7;

    [Test]
    [Ignore]
    procedure multiples_of_3_or_5_up_to_10;

    [Test]
    [Ignore]
    procedure multiples_of_3_or_5_up_to_100;

    [Test]
    [Ignore]
    procedure multiples_of_3_or_5_up_to_1000;

    [Test]
    [Ignore]
    procedure multiples_of_7_13_or_17_up_to_20;

    [Test]
    [Ignore]
    procedure multiples_of_4_or_6_up_to_15;

    [Test]
    [Ignore]
    procedure multiples_of_5_6_or_8_up_to_150;

    [Test]
    [Ignore]
    procedure multiples_of_5_or_25_up_to_51;

    [Test]
    [Ignore]
    procedure multiples_of_43_or_47_up_to_10000;

    [Test]
    [Ignore]
    procedure multiples_of_1_up_to_100;

    [Test]
    [Ignore]
    procedure multiples_of_an_empty_list_up_to_10000;

    [Test]
    [Ignore]
    procedure the_only_multiple_of_0_is_0;
  end;

implementation

procedure TSumsOfMultipleTest.multiples_of_1_up_to_100;
begin
  Assert.AreEqual(4950, TMultiplesOf.Sum(100, [1]));
end;

procedure TSumsOfMultipleTest.multiples_of_3_or_5_up_to_1;
begin
  Assert.AreEqual(0, TMultiplesOf.Sum(1, [3, 5]));
end;

procedure TSumsOfMultipleTest.multiples_of_3_or_5_up_to_10;
begin
  Assert.AreEqual(23, TMultiplesOf.Sum(10, [3, 5]));
end;

procedure TSumsOfMultipleTest.multiples_of_3_or_5_up_to_100;
begin
  Assert.AreEqual(2318, TMultiplesOf.Sum(100, [3, 5]));
end;

procedure TSumsOfMultipleTest.multiples_of_3_or_5_up_to_1000;
begin
  Assert.AreEqual(233168, TMultiplesOf.Sum(1000, [3, 5]));
end;

procedure TSumsOfMultipleTest.multiples_of_3_or_5_up_to_4;
begin
  Assert.AreEqual(3, TMultiplesOf.Sum(4, [3, 5]));
end;

procedure TSumsOfMultipleTest.multiples_of_3_up_to_7;
begin
  Assert.AreEqual(9, TMultiplesOf.Sum(7, [3]));
end;

procedure TSumsOfMultipleTest.multiples_of_43_or_47_up_to_10000;
begin
  Assert.AreEqual(2203160, TMultiplesOf.Sum(10000, [43, 47]));
end;

procedure TSumsOfMultipleTest.multiples_of_4_or_6_up_to_15;
begin
  Assert.AreEqual(30, TMultiplesOf.Sum(15, [4, 6]));
end;

procedure TSumsOfMultipleTest.multiples_of_5_6_or_8_up_to_150;
begin
  Assert.AreEqual(4419, TMultiplesOf.Sum(150, [5, 6, 8]));
end;

procedure TSumsOfMultipleTest.multiples_of_5_or_25_up_to_51;
begin
  Assert.AreEqual(275, TMultiplesOf.Sum(51, [5, 25]));
end;

procedure TSumsOfMultipleTest.multiples_of_7_13_or_17_up_to_20;
begin
  Assert.AreEqual(51, TMultiplesOf.Sum(20, [7, 13, 17]));
end;

procedure TSumsOfMultipleTest.multiples_of_an_empty_list_up_to_10000;
begin
  Assert.AreEqual(0, TMultiplesOf.Sum(10000, []));
end;

procedure TSumsOfMultipleTest.the_only_multiple_of_0_is_0;
begin
  Assert.AreEqual(0, TMultiplesOf.Sum(1, [0]));
end;

initialization
  TDUnitX.RegisterTestFixture(TSumsOfMultipleTest);
end.

