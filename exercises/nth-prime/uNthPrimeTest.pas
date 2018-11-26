unit uNthPrimeTest;

interface

uses
  DUnitX.TestFramework;

const
  CanonicalVersion = '2.1.0';

type
  [TestFixture]
  TNthPrimeTest = class(TObject) 
  public
    [Test]
//    [Ignore('Comment the "[Ignore]" statement to run the test')]
    procedure there_is_no_zeroth_prime;

//  'Uncomment the wanted test cases attributes to run the test')]
//    [TestCase('first prime','1,2')]
//    [TestCase('second prime','2,3')]
//    [TestCase('sixth prime','6,13')]
//    [TestCase('second prime','10001,104743')]
    procedure prime_test(const AValue1 : Integer;const AValue2 : Integer);
  end;

implementation

uses
  System.SysUtils, uNthPrime;

procedure TNthPrimeTest.there_is_no_zeroth_prime;
begin
  Assert.WillRaiseWithMessage(procedure begin NthPrime(0); end , EArgumentOutOfRangeException, 'there is no zeroth prime');
end;

procedure TNthPrimeTest.prime_test(const AValue1 : Integer;const AValue2 : Integer);
begin
  Assert.AreEqual(AValue2, NthPrime(AValue1));
end;

initialization
  TDUnitX.RegisterTestFixture(TNthPrimeTest);
end.
