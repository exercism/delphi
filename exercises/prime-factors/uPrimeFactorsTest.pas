unit uPrimeFactorsTest;

interface
uses
  DUnitX.TestFramework;

type

  [TestFixture]
  TPrimeFactorsTest = class(TObject)
  private
    procedure CompareArrays(Array1, Array2: TArray<Int64>);
  public
    [Test]
//    [Ignore('Comment the "[Ignore]" statement to run the test')]
    procedure no_factors;

    [Test]
//    [Ignore]
    procedure prime_number;

    [Test]
//    [Ignore]
    procedure square_of_a_prime;

    [Test]
//    [Ignore]
    procedure cube_of_a_prime;

    [Test]
//    [Ignore]
    procedure product_of_primes_and_non_primes;

    [Test]
//    [Ignore]
    procedure product_of_primes;

    [Test]
//    [Ignore]
    procedure factors_include_a_large_prime;


  end;

implementation

uses
  System.SysUtils, uPrimeFactors;

procedure TPrimeFactorsTest.CompareArrays(Array1, Array2: TArray<Int64>);
var
  i: integer;
begin
  Assert.AreEqual(Length(Array1), Length(Array2), ' - Array lengths must be equal');
  for i := Low(Array1) to High(Array1) do
    Assert.AreEqual(Array1[i], Array2[i], format('Expecting element %d to = %d, Actual = %d',
      [i, Array1[i], Array2[i]]));
end;

procedure TPrimeFactorsTest.cube_of_a_prime;
begin
  CompareArrays([2, 2, 2], TPrimeFactors.factors(8));
end;

procedure TPrimeFactorsTest.factors_include_a_large_prime;
begin
  CompareArrays([11, 9539, 894119], TPrimeFactors.factors(93819012551));
end;

procedure TPrimeFactorsTest.no_factors;
begin

  CompareArrays([], TPrimeFactors.factors(1));
end;

procedure TPrimeFactorsTest.prime_number;
begin
  CompareArrays([2], TPrimeFactors.factors(2));
end;

procedure TPrimeFactorsTest.product_of_primes;
begin
  CompareArrays([5, 17, 23, 461], TPrimeFactors.factors(901255));
end;

procedure TPrimeFactorsTest.product_of_primes_and_non_primes;
begin
  CompareArrays([2, 2, 3], TPrimeFactors.factors(12));
end;

procedure TPrimeFactorsTest.square_of_a_prime;
begin
  CompareArrays([3, 3], TPrimeFactors.factors(9));
end;

initialization
  TDUnitX.RegisterTestFixture(TPrimeFactorsTest);
end.

(*
 {
          "description": "factors include a large prime",
          "property": "factors",
          "input": {
            "value": 93819012551
          },
          "expected": [11, 9539, 894119]
        }
*)