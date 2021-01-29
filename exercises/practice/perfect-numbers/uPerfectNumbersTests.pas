unit uPerfectNumbersTests;

interface
uses
  DUnitX.TestFramework;

const
  CanonicalVersion = '1.1.0.1';

type

  [TestFixture]
  PerfectNumbersTest = class(TObject)
  public
    [Test]
//    [Ignore('Comment the "[Ignore]" statement to run the test')]
    procedure Smallest_perfect_number_is_classified_correctly;

    [Test]
    [Ignore]
    procedure Medium_perfect_number_is_classified_correctly;

    [Test]
    [Ignore]
    procedure Large_perfect_number_is_classified_correctly;

    [Test]
    [Ignore]
    procedure Smallest_abundant_number_is_classified_correctly;

    [Test]
    [Ignore]
    procedure Medium_abundant_number_is_classified_correctly;

    [Test]
    [Ignore]
    procedure Large_abundant_number_is_classified_correctly;

    [Test]
    [Ignore]
    procedure Smallest_prime_deficient_number_is_classified_correctly;

    [Test]
    [Ignore]
    procedure Smallest_non_prime_deficient_number_is_classified_correctly;

    [Test]
    [Ignore]
    procedure Medium_deficient_number_is_classified_correctly;

    [Test]
    [Ignore]
    procedure Large_deficient_number_is_classified_correctly;

    [Test]
    [Ignore]
    procedure Edge_case_no_factors_other_than_itself_is_classified_correctly;

    [Test]
    [Ignore]
    procedure Zero_is_rejected_not_a_natural_number;

    [Test]
    [Ignore]
    procedure Negative_integer_is_rejected_not_a_natural_number;
  end;

implementation
uses uPerfectNumbers;

procedure PerfectNumbersTest.Smallest_prime_deficient_number_is_classified_correctly;
begin
  Assert.AreEqual(Deficient, PerfectNumber.Classify(2));
end;

procedure PerfectNumbersTest.Smallest_non_prime_deficient_number_is_classified_correctly;
begin
  Assert.AreEqual(Deficient, PerfectNumber.Classify(4));
end;

procedure PerfectNumbersTest.Medium_deficient_number_is_classified_correctly;
begin
  Assert.AreEqual(Deficient, PerfectNumber.Classify(32));
end;

procedure PerfectNumbersTest.Large_deficient_number_is_classified_correctly;
begin
  Assert.AreEqual(Deficient, PerfectNumber.Classify(33550337));
end;

procedure PerfectNumbersTest.Edge_case_no_factors_other_than_itself_is_classified_correctly;
begin
  Assert.AreEqual(Deficient, PerfectNumber.Classify(1));
end;

procedure PerfectNumbersTest.Smallest_perfect_number_is_classified_correctly;
begin
  Assert.AreEqual(Perfect, PerfectNumber.Classify(6));
end;

procedure PerfectNumbersTest.Medium_perfect_number_is_classified_correctly;
begin
  Assert.AreEqual(Perfect, PerfectNumber.Classify(28));
end;

procedure PerfectNumbersTest.Large_perfect_number_is_classified_correctly;
begin
  Assert.AreEqual(Perfect, PerfectNumber.Classify(33550336));
end;

procedure PerfectNumbersTest.Smallest_abundant_number_is_classified_correctly;
begin
  Assert.AreEqual(Abundant, PerfectNumber.Classify(12));
end;

procedure PerfectNumbersTest.Medium_abundant_number_is_classified_correctly;
begin
  Assert.AreEqual(Abundant, PerfectNumber.Classify(30));
end;

procedure PerfectNumbersTest.Large_abundant_number_is_classified_correctly;
begin
  Assert.AreEqual(Abundant, PerfectNumber.Classify(33550335));
end;

procedure PerfectNumbersTest.Zero_is_rejected_not_a_natural_number;
var MyProc: TTestLocalMethod;
begin
  MyProc := procedure
            begin
              PerfectNumber.Classify(0);
            end;

  assert.WillRaiseWithMessage(MyProc, ENotNaturalNumber, 'Classification is only possible for natural numbers.');
end;

procedure PerfectNumbersTest.Negative_integer_is_rejected_not_a_natural_number;
var MyProc: TTestLocalMethod;
begin
  MyProc := procedure
            begin
              PerfectNumber.Classify(-1);
            end;

  assert.WillRaiseWithMessage(MyProc, ENotNaturalNumber, 'Classification is only possible for natural numbers.');
end;

initialization
  TDUnitX.RegisterTestFixture(PerfectNumbersTest);
end.
