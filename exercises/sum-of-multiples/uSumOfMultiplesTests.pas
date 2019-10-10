unit uSumOfMultiplesTests;

interface
uses
  DUnitX.TestFramework, uSumsOfMultiples;

const
  CanonicalVersion = '1.5.0.1';

type
  [TestFixture]
  TSumsOfMultipleTest = class(TObject)
  public
    [Test]
//  [Ignore('Comment the "[Ignore]" statement to run the test')]
    procedure no_multiples_within_limit;

    [Test]
    [Ignore]
    procedure one_factor_has_multiples_within_limit;

    [Test]
    [Ignore]
    procedure more_than_one_multiple_within_limit;

    [Test]
    [Ignore]
    procedure more_than_one_factor_with_multiples_within_limit;

    [Test]
    [Ignore]
    procedure each_multiple_is_only_counted_once;

    [Test]
    [Ignore]
    procedure a_much_larger_limit;

    [Test]
    [Ignore]
    procedure three_factors;

    [Test]
    [Ignore]
    procedure factors_not_relatively_prime;

    [Test]
    [Ignore]
    procedure some_pairs_of_factors_relatively_prime_and_some_not;

    [Test]
    [Ignore]
    procedure one_factor_is_a_multiple_of_another;

    [Test]
    [Ignore]
    procedure much_larger_factors;

    [Test]
    [Ignore]
    procedure all_numbers_are_multiples_of_1;

    [Test]
    [Ignore]
    procedure no_factors_means_an_empty_sum;

    [Test]
    [Ignore]
    procedure the_only_multiple_of_0_is_0;

    [Test]
    [Ignore]
    procedure solutions_using_include_exclude_must_extend_to_cardinality_greater_than_3;

    [Test]
    [Ignore]
    procedure the_factor_0_does_not_affect_the_sum_of_multiples_of_other_factors;
  end;

implementation

procedure TSumsOfMultipleTest.all_numbers_are_multiples_of_1;
begin
  Assert.AreEqual(4950, TMultiplesOf.Sum(100, [1]));
end;

procedure TSumsOfMultipleTest.no_multiples_within_limit;
begin
  Assert.AreEqual(0, TMultiplesOf.Sum(1, [3, 5]));
end;

procedure TSumsOfMultipleTest.more_than_one_factor_with_multiples_within_limit;
begin
  Assert.AreEqual(23, TMultiplesOf.Sum(10, [3, 5]));
end;

procedure TSumsOfMultipleTest.each_multiple_is_only_counted_once;
begin
  Assert.AreEqual(2318, TMultiplesOf.Sum(100, [3, 5]));
end;

procedure TSumsOfMultipleTest.a_much_larger_limit;
begin
  Assert.AreEqual(233168, TMultiplesOf.Sum(1000, [3, 5]));
end;

procedure TSumsOfMultipleTest.one_factor_has_multiples_within_limit;
begin
  Assert.AreEqual(3, TMultiplesOf.Sum(4, [3, 5]));
end;

procedure TSumsOfMultipleTest.more_than_one_multiple_within_limit;
begin
  Assert.AreEqual(9, TMultiplesOf.Sum(7, [3]));
end;

procedure TSumsOfMultipleTest.much_larger_factors;
begin
  Assert.AreEqual(2203160, TMultiplesOf.Sum(10000, [43, 47]));
end;

procedure TSumsOfMultipleTest.factors_not_relatively_prime;
begin
  Assert.AreEqual(30, TMultiplesOf.Sum(15, [4, 6]));
end;

procedure TSumsOfMultipleTest.solutions_using_include_exclude_must_extend_to_cardinality_greater_than_3;
begin
  Assert.AreEqual(39614537, TMultiplesOf.Sum(10000, [2, 3, 5, 7, 11]));
end;

procedure TSumsOfMultipleTest.some_pairs_of_factors_relatively_prime_and_some_not;
begin
  Assert.AreEqual(4419, TMultiplesOf.Sum(150, [5, 6, 8]));
end;

procedure TSumsOfMultipleTest.one_factor_is_a_multiple_of_another;
begin
  Assert.AreEqual(275, TMultiplesOf.Sum(51, [5, 25]));
end;

procedure TSumsOfMultipleTest.three_factors;
begin
  Assert.AreEqual(51, TMultiplesOf.Sum(20, [7, 13, 17]));
end;

procedure TSumsOfMultipleTest.no_factors_means_an_empty_sum;
begin
  Assert.AreEqual(0, TMultiplesOf.Sum(10000, []));
end;

procedure TSumsOfMultipleTest.the_factor_0_does_not_affect_the_sum_of_multiples_of_other_factors;
begin
  Assert.AreEqual(3, TMultiplesOf.Sum(4, [3, 0]));
end;

procedure TSumsOfMultipleTest.the_only_multiple_of_0_is_0;
begin
  Assert.AreEqual(0, TMultiplesOf.Sum(1, [0]));
end;

initialization
  TDUnitX.RegisterTestFixture(TSumsOfMultipleTest);
end.

