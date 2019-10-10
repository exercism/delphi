unit uPalindromeProductsTests;

interface
uses
  DUnitX.TestFramework, uPalindromeProducts;

const
  CanonicalVersion = '1.2.0.1';

type
  [TestFixture]
  TPalindromeProductsTest = class(TObject)
  private
    Expected, Actual : TPalindromeResult;
    procedure Compare(Expected, Actual : TPalindromeResult);
  public
    [Test]
//    [Ignore('Comment the "[Ignore]" statement to run the test')]
    procedure finds_the_smallest_palindrome_from_single_digit_factors;

    [Test]
    [Ignore]
    procedure finds_the_largest_palindrome_from_single_digit_factors;

    [Test]
    [Ignore]
    procedure find_the_smallest_palindrome_from_double_digit_factors;

    [Test]
    [Ignore]
    procedure find_the_largest_palindrome_from_double_digit_factors;

    [Test]
    [Ignore]
    procedure find_smallest_palindrome_from_triple_digit_factors;

    [Test]
    [Ignore]
    procedure find_largest_palindrome_from_triple_digit_factors;

    [Test]
    [Ignore]
    procedure find_smallest_palindrome_from_four_digit_factors;

    [Test]
    [Ignore]
    procedure find_largest_palindrome_from_four_digit_factors;

    [Test]
    [Ignore]
    procedure error_result_for_smallest_if_min_is_more_than_max;

    [Test]
    [Ignore]
    procedure error_result_for_largest_if_min_is_more_than_max;

    [Test]
    [Ignore]
    procedure empty_result_for_smallest_if_no_palindrome_in_the_range;

    [Test]
    [Ignore]
    procedure empty_result_for_largest_if_no_palindrome_in_the_range;
  end;

implementation

uses
  System.SysUtils;

procedure TPalindromeProductsTest.empty_result_for_largest_if_no_palindrome_in_the_range;
begin
  Expected := nil;
  Actual := TPalindromeProduct.Largest(15, 15);
  assert.AreEqual(Expected, Actual);
end;

procedure TPalindromeProductsTest.empty_result_for_smallest_if_no_palindrome_in_the_range;
begin
  Expected := nil;
  Actual := TPalindromeProduct.Smallest(1002, 1003);
  assert.AreEqual(Expected, Actual);
end;

procedure TPalindromeProductsTest.error_result_for_largest_if_min_is_more_than_max;
begin
  Assert.WillRaiseWithMessage(
    procedure()
    begin
      TPalindromeProduct.Largest(2, 1)
    end,
    EArgumentException, 'min must be <= max');
end;

procedure TPalindromeProductsTest.error_result_for_smallest_if_min_is_more_than_max;
begin
  Assert.WillRaiseWithMessage(
    procedure()
    begin
      TPalindromeProduct.Smallest(10000, 1)
    end,
    EArgumentException, 'min must be <= max');
end;

procedure TPalindromeProductsTest.Compare(Expected, Actual : TPalindromeResult);

  procedure CompareArrays(Array1, Array2: TArray<integer>);
  var
    i: integer;
  begin
    Assert.AreEqual(Length(Array1), Length(Array2), ' - Array lengths must be equal');
    for i := Low(Array1) to High(Array1) do
      Assert.AreEqual(Array1[i], Array2[i], 'min must be <= max');
  end;

var
  i: Integer;
begin
  i := length(Actual);
  Assert.AreEqual( 2, i,
    format('Result is not well formatted, expected 2 members, but %d found', [i]));
  Assert.AreEqual(Expected[0, 0, 0], Actual[0, 0, 0],
    format('Expected palindrome value %d, but %d found', [Expected[0, 0, 0], Actual[0, 0, 0]]));
  Assert.AreEqual( length(Expected[1]), length(Actual[1]),
    format('Expected %d factors, but %d found', [length(Expected[1]), length(Actual[1])]));
  for i := Low(Expected[1]) to High(Expected[1]) do
    CompareArrays(Expected[1, i], Actual[1, i]);
end;

procedure TPalindromeProductsTest.finds_the_largest_palindrome_from_single_digit_factors;
begin
  Expected :=[ [[9]], [[1, 9], [3, 3]] ];
  Compare(Expected, TPalindromeProduct.Largest(1, 9));
end;

procedure TPalindromeProductsTest.finds_the_smallest_palindrome_from_single_digit_factors;
begin
  Expected :=[ [[1]], [[1, 1]] ];
  Compare(Expected, TPalindromeProduct.Smallest(1, 9));
end;

procedure TPalindromeProductsTest.find_largest_palindrome_from_four_digit_factors;
begin
  Expected :=[ [[99000099]], [[9901, 9999]] ];
  Compare(Expected, TPalindromeProduct.Largest(1000, 9999));
end;

procedure TPalindromeProductsTest.find_largest_palindrome_from_triple_digit_factors;
begin
  Expected :=[ [[906609]], [[913, 993]] ];
  Compare(Expected, TPalindromeProduct.Largest(100, 999));
end;

procedure TPalindromeProductsTest.find_smallest_palindrome_from_four_digit_factors;
begin
  Expected :=[ [[1002001]], [[1001, 1001]] ];
  Compare(Expected, TPalindromeProduct.Smallest(1000, 9999));
end;

procedure TPalindromeProductsTest.find_smallest_palindrome_from_triple_digit_factors;
begin
  Expected :=[ [[10201]], [[101, 101]] ];
  Compare(Expected, TPalindromeProduct.Smallest(100, 999));
end;

procedure TPalindromeProductsTest.find_the_largest_palindrome_from_double_digit_factors;
begin
  Expected :=[ [[9009]], [[91, 99]] ];
  Compare(Expected, TPalindromeProduct.Largest(10, 99));
end;

procedure TPalindromeProductsTest.find_the_smallest_palindrome_from_double_digit_factors;
begin
  Expected :=[ [[121]], [[11, 11]] ];
  Compare(Expected, TPalindromeProduct.Smallest(10, 99));
end;

initialization
  TDUnitX.RegisterTestFixture(TPalindromeProductsTest);
end.
