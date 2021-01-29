unit uBinarySearchTests;

interface
uses
  DUnitX.TestFramework;

const
  CanonicalVersion = '1.3.0.1';

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
    procedure A_value_smaller_than_the_arrays_smallest_value_is_not_found;

    [Test]
    [Ignore]
    procedure A_value_larger_than_the_arrays_largest_value_is_not_found;

    [Test]
    [Ignore]
    procedure Nothing_is_found_in_an_empty_array;

    [Test]
    [Ignore]
    procedure Nothing_is_found_when_the_left_and_right_bounds_cross;
  end;

implementation
uses System.Generics.Collections, uBinarySearch;

procedure TBinarySearchTest.Nothing_is_found_when_the_left_and_right_bounds_cross;
begin
  Assert.AreEqual(-1, BinarySearch.Search([1, 2], 0));
end;

procedure TBinarySearchTest.Nothing_is_found_in_an_empty_array;
begin
  Assert.AreEqual(-1, BinarySearch.Search([], 6));
end;

procedure TBinarySearchTest.Finds_a_value_in_an_array_with_one_element;
begin
  Assert.AreEqual(0, BinarySearch.Search([6], 6));
end;

procedure TBinarySearchTest.Finds_a_value_in_the_middle_of_an_array;
begin
  Assert.AreEqual(3, BinarySearch.Search([1, 3, 4, 6, 8, 9, 11], 6));
end;

procedure TBinarySearchTest.Finds_a_value_at_the_beginning_of_an_array;
begin
  Assert.AreEqual(0, BinarySearch.Search([1, 3, 4, 6, 8, 9, 11], 1));
end;

procedure TBinarySearchTest.Finds_a_value_at_the_end_of_an_array;
begin
  Assert.AreEqual(6, BinarySearch.Search([1, 3, 4, 6, 8, 9, 11], 11));
end;

procedure TBinarySearchTest.Finds_a_value_in_an_array_of_odd_length;
begin
  Assert.AreEqual(9, BinarySearch.Search([1, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 634], 144));
end;

procedure TBinarySearchTest.Finds_a_value_in_an_array_of_even_length;
begin
  Assert.AreEqual(5, BinarySearch.Search([1, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377], 21));
end;

procedure TBinarySearchTest.Identifies_that_a_value_is_not_included_in_the_array;
begin
  Assert.AreEqual(-1, BinarySearch.Search([1, 3, 4, 6, 8, 9, 11], 7));
end;

procedure TBinarySearchTest.A_value_larger_than_the_arrays_largest_value_is_not_found;
begin
  Assert.AreEqual(-1, BinarySearch.Search([1, 3, 4, 6, 8, 9, 11], 13));
end;

procedure TBinarySearchTest.A_value_smaller_than_the_arrays_smallest_value_is_not_found;
begin
  Assert.AreEqual(-1, BinarySearch.Search([1, 3, 4, 6, 8, 9, 11], 0));
end;

initialization
  TDUnitX.RegisterTestFixture(TBinarySearchTest);
end.
