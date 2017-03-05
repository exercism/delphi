unit uPerfectNumbersTest;

interface
uses
  DUnitX.TestFramework;

type

  [TestFixture]
  PerfectNumbersTest = class(TObject) 
  public
    [Test]
    procedure Can_classify_3_as_deficient;

    [Test]
    [Ignore('Comment these lines to run these tests')]
    procedure Can_classify_7_as_deficient;

    [Test]
    [Ignore]
    procedure Can_classify_13_as_deficient;

    [Test]
    [Ignore]
    procedure Can_classify_6_as_perfect;

    [Test]
    [Ignore]
    procedure Can_classify_28_as_perfect;

    [Test]
    [Ignore]
    procedure Can_classify_496_as_perfect;

    [Test]
    [Ignore]
    procedure Can_classify_12_as_abundant;

    [Test]
    [Ignore]
    procedure Can_classify_18_as_abundant;

    [Test]
    [Ignore]
    procedure Can_classify_20_as_abundant;
  end;

implementation
uses uPerfectNumbers;

procedure PerfectNumbersTest.Can_classify_3_as_deficient;
begin
  Assert.AreEqual(Deficient, PerfectNumber.Classify(3));
end;

procedure PerfectNumbersTest.Can_classify_7_as_deficient;
begin
  Assert.AreEqual(Deficient, PerfectNumber.Classify(7));
end;

procedure PerfectNumbersTest.Can_classify_13_as_deficient;
begin
  Assert.AreEqual(Deficient, PerfectNumber.Classify(13));
end;

procedure PerfectNumbersTest.Can_classify_6_as_perfect;
begin
  Assert.AreEqual(Perfect, PerfectNumber.Classify(6));
end;

procedure PerfectNumbersTest.Can_classify_28_as_perfect;
begin
  Assert.AreEqual(Perfect, PerfectNumber.Classify(28));
end;

procedure PerfectNumbersTest.Can_classify_496_as_perfect;
begin
  Assert.AreEqual(Perfect, PerfectNumber.Classify(496));
end;

procedure PerfectNumbersTest.Can_classify_12_as_abundant;
begin
  Assert.AreEqual(Abundant, PerfectNumber.Classify(12));
end;

procedure PerfectNumbersTest.Can_classify_18_as_abundant;
begin
  Assert.AreEqual(Abundant, PerfectNumber.Classify(18));
end;

procedure PerfectNumbersTest.Can_classify_20_as_abundant;
begin
  Assert.AreEqual(Abundant, PerfectNumber.Classify(20));
end;

initialization
  TDUnitX.RegisterTestFixture(PerfectNumbersTest);
end.
