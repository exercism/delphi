unit uNthPrimeTests;

interface

uses
  DUnitX.TestFramework;

const
  CanonicalVersion = '2.1.0.1';

type
  [TestFixture]
  TNthPrimeTest = class(TObject) 
  public
    [Test]
//    [Ignore('Comment the "[Ignore]" statement to run the test')]
    procedure there_is_no_zeroth_prime;

    [Test]
    [Ignore]
    procedure first_prime;

    [Test]
    [Ignore]
    procedure second_prime;

    [Test]
    [Ignore]
    procedure sixth_prime;

    [Test]
    [Ignore]
    procedure big_prime;
  end;

implementation

uses
  System.SysUtils, uNthPrime;


procedure TNthPrimeTest.first_prime;
begin
  Assert.AreEqual(2, NthPrime(1));
end;

procedure TNthPrimeTest.second_prime;
begin
  Assert.AreEqual(3, NthPrime(2));
end;

procedure TNthPrimeTest.sixth_prime;
begin
  Assert.AreEqual(13, NthPrime(6));
end;

procedure TNthPrimeTest.big_prime;
begin
  Assert.AreEqual(104743, NthPrime(10001));
end;

procedure TNthPrimeTest.there_is_no_zeroth_prime;
begin
  Assert.WillRaiseWithMessage(procedure begin NthPrime(0); end , EArgumentOutOfRangeException, 'there is no zeroth prime');
end;

initialization
  TDUnitX.RegisterTestFixture(TNthPrimeTest);
end.
