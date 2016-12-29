unit uPerfectNumbersTest;

interface
uses
  DUnitX.TestFramework;

type

  [TestFixture]
  PerfectNumbersTest = class(TObject) 
  public
    [TestCase('3','3')]
//    [TestCase('7','7')]
//    [TestCase('13','13')]
    procedure Can_classify_deficient_numbers(const aNumber: Integer);

//    [TestCase('6','6')]
//    [TestCase('28','28')]
//    [TestCase('496','496')]
    procedure Can_classify_perfect_numbers(const aNumber: Integer);

//    [TestCase('12','12')]
//    [TestCase('18','18')]
//    [TestCase('20','20')]
    procedure Can_classify_abundant_numbers(const aNumber: Integer);
  end;

implementation
uses uPerfectNumbers;

procedure PerfectNumbersTest.Can_classify_deficient_numbers(const aNumber: Integer);
begin
  Assert.AreEqual(Deficient, PerfectNumber.Classify(aNumber));
end;

procedure PerfectNumbersTest.Can_classify_perfect_numbers(const aNumber: Integer);
begin
  Assert.AreEqual(Perfect, PerfectNumber.Classify(aNumber));
end;

procedure PerfectNumbersTest.Can_classify_abundant_numbers(const aNumber: Integer);
begin
  Assert.AreEqual(Abundant, PerfectNumber.Classify(aNumber));
end;

initialization
  TDUnitX.RegisterTestFixture(PerfectNumbersTest);
end.
