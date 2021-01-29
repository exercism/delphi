unit uSieveTests;

interface
uses
  DUnitX.TestFramework, uSieve;

const
  CanonicalVersion = '1.1.0.1';

type

  [TestFixture]
  TSieveTest = class(TObject)
  private
    procedure CompareArrays(Array1, Array2: TArray<integer>);
  public
    [Test]
//    [Ignore('Comment the "[Ignore]" statement to run the test')]
    procedure no_primes_under_two;

    [Test]
    [Ignore]
    procedure find_first_prime;

    [Test]
    [Ignore]
    procedure find_primes_up_to_10;

     [Test]
    [Ignore]
    procedure limit_is_prime;

    [Test]
    [Ignore]
    procedure find_primes_up_to_1000;
  end;

implementation

uses
  System.SysUtils;

procedure TSieveTest.CompareArrays(Array1, Array2: TArray<integer>);
var
  i: integer;
begin
  Assert.AreEqual(Length(Array1), Length(Array2), ' - Array lengths must be equal');
  for i := Low(Array1) to High(Array1) do
    Assert.AreEqual(Array1[i], Array2[i], format('Expecting element %d to = %d, Actual = %d',
      [i, Array1[i], Array2[i]]));
end;

procedure TSieveTest.find_first_prime;
begin
  CompareArrays([2], TSieve.Primes(2));
end;

procedure TSieveTest.find_primes_up_to_10;
begin
  CompareArrays([2, 3, 5, 7], TSieve.Primes(10));
end;

procedure TSieveTest.find_primes_up_to_1000;
begin
  CompareArrays([
          2,   3,   5,   7,  11,  13,  17,  19,  23,  29,  31,  37,  41,  43,
         47,  53,  59,  61,  67,  71,  73,  79,  83,  89,  97, 101, 103, 107,
        109, 113, 127, 131, 137, 139, 149, 151, 157, 163, 167, 173, 179, 181,
        191, 193, 197, 199, 211, 223, 227, 229, 233, 239, 241, 251, 257, 263,
        269, 271, 277, 281, 283, 293, 307, 311, 313, 317, 331, 337, 347, 349,
        353, 359, 367, 373, 379, 383, 389, 397, 401, 409, 419, 421, 431, 433,
        439, 443, 449, 457, 461, 463, 467, 479, 487, 491, 499, 503, 509, 521,
        523, 541, 547, 557, 563, 569, 571, 577, 587, 593, 599, 601, 607, 613,
        617, 619, 631, 641, 643, 647, 653, 659, 661, 673, 677, 683, 691, 701,
        709, 719, 727, 733, 739, 743, 751, 757, 761, 769, 773, 787, 797, 809,
        811, 821, 823, 827, 829, 839, 853, 857, 859, 863, 877, 881, 883, 887,
        907, 911, 919, 929, 937, 941, 947, 953, 967, 971, 977, 983, 991, 997], TSieve.Primes(1000));
end;

procedure TSieveTest.limit_is_prime;
begin
  CompareArrays([2, 3, 5, 7, 11, 13], TSieve.Primes(13));
end;

procedure TSieveTest.no_primes_under_two;
begin
  CompareArrays([], TSieve.Primes(1));
end;

initialization
  TDUnitX.RegisterTestFixture(TSieveTest);
end.
