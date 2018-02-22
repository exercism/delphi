unit uBinarySearchTest;

interface
uses
  DUnitX.TestFramework;

const
  CanonicalVersion = '1.1.0';

type

  [TestFixture]
  TBinarySearchTest = class(TObject)
  public
    [Test]
//    [Ignore('Comment the "[Ignore]" statement to run the test')]
    procedure Finds_a_value_in_an_array_with_one_element;

    [Test]
    [Ignore]
    procedure Finds_a_value_in_the_middle_of_an_array;

    [Test]
    [Ignore]
    procedure Finds_a_value_at_the_beginning_of_an_array;

    [Test]
    [Ignore]
    procedure Finds_a_value_at_the_end_of_an_array;

    [Test]
    [Ignore]
    procedure Finds_a_value_in_an_array_of_odd_length;

    [Test]
    [Ignore]
    procedure Finds_a_value_in_an_array_of_even_length;

    [Test]
    [Ignore]
    procedure Identifies_that_a_value_is_not_included_in_the_array;

    [Test]
    [Ignore]
    procedure A_value_smaller_than_the_arrays_smallest_value_is_not_included;

    [Test]
    [Ignore]
    procedure A_value_larger_than_the_arrays_largest_value_is_not_included;

    [Test]
    [Ignore]
    procedure Nothing_is_included_in_an_empty_array;
  end;

implementation
uses System.Generics.Collections, uBinarySearch;

procedure TBinarySearchTest.Nothing_is_included_in_an_empty_array;
var input: TArray<Integer>;
begin
  SetLength(input, 0);
  Assert.AreEqual(-1, BinarySearch.Search(input, 6));
end;

procedure TBinarySearchTest.Finds_a_value_in_an_array_with_one_element;
var input: TArray<integer>;
begin
  SetLength(input, 1);
  input[0] := 6;

  Assert.AreEqual(0, BinarySearch.Search(input, 6));
end;

procedure TBinarySearchTest.Finds_a_value_in_the_middle_of_an_array;
var inputList: TList<integer>;
begin
  inputList := TList<integer>.Create;
  inputList.AddRange([1, 3, 4, 6, 8, 9, 11]);

  Assert.AreEqual(3, BinarySearch.Search(inputList.ToArray, 6));
end;

procedure TBinarySearchTest.Finds_a_value_at_the_beginning_of_an_array;
var inputList: TList<integer>;
begin
  inputList := TList<integer>.Create;
  inputList.AddRange([1, 3, 4, 6, 8, 9, 11]);

  Assert.AreEqual(0, BinarySearch.Search(inputList.ToArray, 1));
end;

procedure TBinarySearchTest.Finds_a_value_at_the_end_of_an_array;
var inputList: TList<integer>;
begin
  inputList := TList<integer>.Create;
  inputList.AddRange([1, 3, 4, 6, 8, 9, 11]);

  Assert.AreEqual(6, BinarySearch.Search(inputList.ToArray, 11));
end;

procedure TBinarySearchTest.Finds_a_value_in_an_array_of_odd_length;
var inputList: TList<integer>;
begin
  inputList := TList<integer>.Create;
  inputList.AddRange([1, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 634]);

  Assert.AreEqual(9, BinarySearch.Search(inputList.ToArray, 144));
end;

procedure TBinarySearchTest.Finds_a_value_in_an_array_of_even_length;
var inputList: TList<integer>;
begin
  inputList := TList<integer>.Create;
  inputList.AddRange([1, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377]);

  Assert.AreEqual(5, BinarySearch.Search(inputList.ToArray, 21));
end;

procedure TBinarySearchTest.Identifies_that_a_value_is_not_included_in_the_array;
var inputList: TList<integer>;
begin
  inputList := TList<integer>.Create;
  inputList.AddRange([1, 3, 4, 6, 8, 9, 11]);

  Assert.AreEqual(-1, BinarySearch.Search(inputList.ToArray, 7));
end;

procedure TBinarySearchTest.A_value_larger_than_the_arrays_largest_value_is_not_included;
var inputList: TList<integer>;
begin
  inputList := TList<integer>.Create;
  inputList.AddRange([1, 3, 4, 6, 8, 9, 11]);

  Assert.AreEqual(-1, BinarySearch.Search(inputList.ToArray, 13));
end;

procedure TBinarySearchTest.A_value_smaller_than_the_arrays_smallest_value_is_not_included;
var inputList: TList<integer>;
begin
  inputList := TList<integer>.Create;
  inputList.AddRange([1, 3, 4, 6, 8, 9, 11]);

  Assert.AreEqual(-1, BinarySearch.Search(inputList.ToArray, 0));
end;

initialization
  TDUnitX.RegisterTestFixture(TBinarySearchTest);
end.
