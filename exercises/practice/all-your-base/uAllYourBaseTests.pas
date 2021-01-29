unit uAllYourBaseTests;

interface
uses
  DUnitX.TestFramework, System.SysUtils;

const
  CanonicalVersion = '2.3.0.1';

type
  [TestFixture]
  TAllYourBaseTest = class(TObject)
  private
    procedure CompareArrays(Array1, Array2: TArray<integer>);
  public
    [Test]
//    [Ignore('Comment the "[Ignore]" statement to run the test')]
    procedure single_bit_one_to_decimal;

    [Test]
    [Ignore]
    procedure binary_to_single_decimal;

    [Test]
    [Ignore]
    procedure single_decimal_to_binary;

    [Test]
    [Ignore]
    procedure binary_to_multiple_decimal;

    [Test]
    [Ignore]
    procedure decimal_to_binary;

    [Test]
    [Ignore]
    procedure trinary_to_hexadecimal;

    [Test]
    [Ignore]
    procedure hexadecimal_to_trinary;

    [Test]
    [Ignore]
    procedure integer_15_bit;

    [Test]
    [Ignore]
    procedure empty_list;

    [Test]
    [Ignore]
    procedure single_zero;

    [Test]
    [Ignore]
    procedure multiple_zeros;

    [Test]
    [Ignore]
    procedure leading_zeros;

    [Test]
    [Ignore]
    procedure input_base_is_one;

    [Test]
    [Ignore]
    procedure input_base_is_zero;

    [Test]
    [Ignore]
    procedure input_base_is_negative;

    [Test]
    [Ignore]
    procedure negative_digit;

    [Test]
    [Ignore]
    procedure invalid_positive_digit;

    [Test]
    [Ignore]
    procedure output_base_is_one;

    [Test]
    [Ignore]
    procedure output_base_is_zero;

    [Test]
    [Ignore]
    procedure output_base_is_negative;

    [Test]
    [Ignore]
    procedure both_bases_are_negative;
  end;

implementation
uses uAllYourBase;

procedure TAllYourBaseTest.binary_to_multiple_decimal;
begin
  CompareArrays([4, 2], TBase.Rebase(2, [1, 0, 1, 0, 1, 0], 10));
end;

procedure TAllYourBaseTest.binary_to_single_decimal;
begin
  CompareArrays([5], TBase.Rebase(2, [1, 0, 1], 10));
end;

procedure TAllYourBaseTest.both_bases_are_negative;
begin
  Assert.WillRaise(procedure
    begin
      TBase.Rebase(-2, [1], -7);
    end, EArgumentOutOfRangeException, 'input base must be >= 2');
end;

procedure TAllYourBaseTest.CompareArrays(Array1, Array2: TArray<integer>);
var
  i: integer;
begin
  Assert.AreEqual(Length(Array1), Length(Array2), ' - Array lengths must be equal');
  for i := Low(Array1) to High(Array1) do
    Assert.AreEqual(Array1[i], Array2[i], format('Expecting element %d to = %d, Actual = %d',
      [i, Array1[i], Array2[i]]));
end;

procedure TAllYourBaseTest.decimal_to_binary;
begin
  CompareArrays([1, 0, 1, 0, 1, 0], TBase.Rebase(10, [4, 2], 2));
end;

procedure TAllYourBaseTest.empty_list;
begin
  CompareArrays([0], TBase.Rebase(2, [], 10));
end;

procedure TAllYourBaseTest.hexadecimal_to_trinary;
begin
  CompareArrays([1, 1, 2, 0], TBase.Rebase(16, [2, 10], 3));
end;

procedure TAllYourBaseTest.input_base_is_negative;
begin
  Assert.WillRaise(procedure
    begin
      TBase.Rebase(-2, [1], 10);
    end, EArgumentOutOfRangeException, 'input base must be >= 2');
end;

procedure TAllYourBaseTest.input_base_is_one;
begin
  Assert.WillRaise(procedure
    begin
      TBase.Rebase(1, [0], 10);
    end, EArgumentOutOfRangeException, 'input base must be >= 2');
end;

procedure TAllYourBaseTest.input_base_is_zero;
begin
  Assert.WillRaise(procedure
    begin
      TBase.Rebase(0, [0], 10);
    end, EArgumentOutOfRangeException, 'input base must be >= 2');
end;

procedure TAllYourBaseTest.integer_15_bit;
begin
  CompareArrays([6, 10, 45], TBase.Rebase(97, [3, 46, 60], 73));
end;

procedure TAllYourBaseTest.invalid_positive_digit;
begin
  Assert.WillRaise(procedure
    begin
      TBase.Rebase(2, [1, 2, 1, 0, 1, 0], 10);
    end, EArgumentOutOfRangeException, 'all digits must satisfy 0 <= d < input base');
end;

procedure TAllYourBaseTest.leading_zeros;
begin
  CompareArrays([4, 2], TBase.Rebase(7, [0, 6, 0], 10));
end;

procedure TAllYourBaseTest.multiple_zeros;
begin
  CompareArrays([0], TBase.Rebase(10, [0, 0, 0], 2));
end;

procedure TAllYourBaseTest.negative_digit;
begin
  Assert.WillRaise(procedure
    begin
      TBase.Rebase(2, [1, -1, 1, 0, 1, 0], 10);
    end, EArgumentOutOfRangeException, 'all digits must satisfy 0 <= d < input base');
end;

procedure TAllYourBaseTest.output_base_is_negative;
begin
  Assert.WillRaise(procedure
    begin
      TBase.Rebase(2, [1], -7);
    end, EArgumentOutOfRangeException, 'output base must be >= 2');
end;

procedure TAllYourBaseTest.output_base_is_one;
begin
  Assert.WillRaise(procedure
    begin
      TBase.Rebase(2, [1, 0, 1, 0, 1, 0], 1);
    end, EArgumentOutOfRangeException, 'output base must be >= 2');
end;

procedure TAllYourBaseTest.output_base_is_zero;
begin
  Assert.WillRaise(procedure
    begin
      TBase.Rebase(10, [7], 0);
    end, EArgumentOutOfRangeException, 'output base must be >= 2');
end;

procedure TAllYourBaseTest.single_bit_one_to_decimal;
begin
  CompareArrays([1], TBase.Rebase(2, [1], 10));
end;

procedure TAllYourBaseTest.single_decimal_to_binary;
begin
  CompareArrays([1, 0, 1], TBase.Rebase(10, [5], 2));
end;

procedure TAllYourBaseTest.single_zero;
begin
  CompareArrays([0], TBase.Rebase(10, [0], 2));
end;

procedure TAllYourBaseTest.trinary_to_hexadecimal;
begin
  CompareArrays([2, 10], TBase.Rebase(3, [1, 1, 2, 0], 16));
end;

initialization
  TDUnitX.RegisterTestFixture(TAllYourBaseTest);
end.

