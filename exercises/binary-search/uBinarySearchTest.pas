unit uBinarySearchTest;

interface
uses
  DUnitX.TestFramework;

type

  [TestFixture]
  TBinarySearchTest = class(TObject)
  public
    [Test]
//  [Ignore('Comment the "[Ignore]" statement to run the test')]
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
uses System.Generics.Collections, uBinarySearch;

procedure TBinarySearchTest.Should_return_minus_one_when_an_empty_array_is_searched;
var input: TArray<Integer>;
begin
  SetLength(input, 0);
  Assert.AreEqual(-1, BinarySearch.Search(input, 6));
end;

procedure TBinarySearchTest.Should_be_able_to_find_a_value_in_a_single_element_array_with_one_access;
var input: TArray<integer>;
begin
  SetLength(input, 1);
  input[0] := 6;

  Assert.AreEqual(0, BinarySearch.Search(input, 6));
end;

procedure TBinarySearchTest.Should_return_minus_one_if_a_value_is_less_than_the_element_in_a_single_element_array;
var input: TArray<integer>;
begin
  SetLength(input, 1);
  input[0] := 94;

  Assert.AreEqual(-1, BinarySearch.Search(input, 6));
end;

procedure TBinarySearchTest.Should_return_minus_one_if_a_value_is_greater_than_the_element_in_a_single_element_array;
var input: TArray<integer>;
begin
  SetLength(input, 1);
  input[0] := 94;

  Assert.AreEqual(-1, BinarySearch.Search(input, 602));
end;

procedure TBinarySearchTest.Should_find_an_element_in_a_longer_array;
var inputList: TList<integer>;
begin
  inputList := TList<integer>.Create;
  inputList.AddRange([6, 67, 123, 345, 456, 457, 490, 2002, 54321, 54322]);

  Assert.AreEqual(7, BinarySearch.Search(inputList.ToArray, 2002));
end;

procedure TBinarySearchTest.Should_find_elements_at_the_beginning_of_an_array;
var inputList: TList<integer>;
begin
  inputList := TList<integer>.Create;
  inputList.AddRange([6, 67, 123, 345, 456, 457, 490, 2002, 54321, 54322]);

  Assert.AreEqual(0, BinarySearch.Search(inputList.ToArray, 6));
end;

procedure TBinarySearchTest.Should_find_elements_at_the_end_of_an_array;
var inputList: TList<integer>;
begin
  inputList := TList<integer>.Create;
  inputList.AddRange([6, 67, 123, 345, 456, 457, 490, 2002, 54321, 54322]);

  Assert.AreEqual(9, BinarySearch.Search(inputList.ToArray, 54322));
end;

procedure TBinarySearchTest.Should_return_minus_one_if_a_value_is_less_than_all_elements_in_a_long_array;
var inputList: TList<integer>;
begin
  inputList := TList<integer>.Create;
  inputList.AddRange([6, 67, 123, 345, 456, 457, 490, 2002, 54321, 54322]);

  Assert.AreEqual(-1, BinarySearch.Search(inputList.ToArray, 2));
end;

procedure TBinarySearchTest.Should_return_minus_one_if_a_value_is_greater_than_all_elements_in_a_long_array;
var inputList: TList<integer>;
begin
  inputList := TList<integer>.Create;
  inputList.AddRange([6, 67, 123, 345, 456, 457, 490, 2002, 54321, 54322]);

  Assert.AreEqual(-1, BinarySearch.Search(inputList.ToArray, 54323));
end;

initialization
  TDUnitX.RegisterTestFixture(TBinarySearchTest);
end.
