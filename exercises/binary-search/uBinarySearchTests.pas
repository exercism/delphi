unit uBinarySearchTests;

interface
uses
  DUnitX.TestFramework;

type

  [TestFixture]
  BinarySearchTests = class(TObject) 
  public
    [Test]
    [Ignore]
    procedure Should_return_minus_one_when_an_empty_array_is_searched;

    [Test]
    [Ignore]
    procedure Should_be_able_to_find_a_value_in_a_single_element_array_with_one_access;

    [Test]
    [Ignore]
    procedure Should_return_minus_one_if_a_value_is_less_than_the_element_in_a_single_element_array;

    [Test]
    [Ignore]
    procedure Should_return_minus_one_if_a_value_is_greater_than_the_element_in_a_single_element_array;

    [Test]
    [Ignore]
    procedure Should_find_an_element_in_a_longer_array;

    [Test]
    [Ignore]
    procedure Should_find_elements_at_the_beginning_of_an_array;

    [Test]
    [Ignore]
    procedure Should_find_elements_at_the_end_of_an_array;

    [Test]
    [Ignore]
    procedure Should_return_minus_one_if_a_value_is_less_than_all_elements_in_a_long_array;

    [Test]
    [Ignore]
    procedure Should_return_minus_one_if_a_value_is_greater_than_all_elements_in_a_long_array;
  end;

implementation
uses uBinarySearch;

procedure BinarySearchTests.Should_return_minus_one_when_an_empty_array_is_searched;
var input: TArray<integer>;
begin
  SetLength(input, 1);
  assert.AreEqual(-1, TBinarySearch.Search(input, 6));
end;

procedure BinarySearchTests.Should_be_able_to_find_a_value_in_a_single_element_array_with_one_access;
var input: TArray<integer>;
begin
  SetLength(input, 1);
  input[0] := 6;
  assert.AreEqual(0, TBinarySearch.Search(input, 6));
end;

procedure BinarySearchTests.Should_return_minus_one_if_a_value_is_less_than_the_element_in_a_single_element_array;
var input: TArray<integer>;
begin
  SetLength(input, 1);
  input[0] := 94;
  assert.AreEqual(-1, TBinarySearch.Search(input, 6));
end;

procedure BinarySearchTests.Should_return_minus_one_if_a_value_is_greater_than_the_element_in_a_single_element_array;
var input: TArray<integer>;
begin
  SetLength(input, 1);
  input[0] := 94;
  assert.AreEqual(-1, TBinarySearch.Search(input, 602));
end;

procedure BinarySearchTests.Should_find_an_element_in_a_longer_array;
var input: TArray<integer>;
begin
  SetLength(input, 10);
  input[0] := 6;
  input[1] := 67;
  input[2] := 123;
  input[3] := 345;
  input[4] := 456;
  input[5] := 457;
  input[6] := 490;
  input[7] := 2002;
  input[8] := 54321;
  input[9] := 54322;
  assert.AreEqual(7, TBinarySearch.Search(input, 2002));
end;

procedure BinarySearchTests.Should_find_elements_at_the_beginning_of_an_array;
var input: TArray<integer>;
begin
  SetLength(input, 10);
  input[0] := 6;
  input[1] := 67;
  input[2] := 123;
  input[3] := 345;
  input[4] := 456;
  input[5] := 457;
  input[6] := 490;
  input[7] := 2002;
  input[8] := 54321;
  input[9] := 54322;
  assert.AreEqual(0, TBinarySearch.Search(input, 6));
end;

procedure BinarySearchTests.Should_find_elements_at_the_end_of_an_array;
var input: TArray<integer>;
begin
  SetLength(input, 10);
  input[0] := 6;
  input[1] := 67;
  input[2] := 123;
  input[3] := 345;
  input[4] := 456;
  input[5] := 457;
  input[6] := 490;
  input[7] := 2002;
  input[8] := 54321;
  input[9] := 54322;
  assert.AreEqual(9, TBinarySearch.Search(input, 54322));
end;

procedure BinarySearchTests.Should_return_minus_one_if_a_value_is_less_than_all_elements_in_a_long_array;
var input: TArray<integer>;
begin
  SetLength(input, 10);
  input[0] := 6;
  input[1] := 67;
  input[2] := 123;
  input[3] := 345;
  input[4] := 456;
  input[5] := 457;
  input[6] := 490;
  input[7] := 2002;
  input[8] := 54321;
  input[9] := 54322;
  assert.AreEqual(-1, TBinarySearch.Search(input, 2));
end;

procedure BinarySearchTests.Should_return_minus_one_if_a_value_is_greater_than_all_elements_in_a_long_array;
var input: TArray<integer>;
begin
  SetLength(input, 10);
  input[0] := 6;
  input[1] := 67;
  input[2] := 123;
  input[3] := 345;
  input[4] := 456;
  input[5] := 457;
  input[6] := 490;
  input[7] := 2002;
  input[8] := 54321;
  input[9] := 54322;
  assert.AreEqual(-1, TBinarySearch.Search(input, 54323));
end;

initialization
  TDUnitX.RegisterTestFixture(BinarySearchTests);
end.
