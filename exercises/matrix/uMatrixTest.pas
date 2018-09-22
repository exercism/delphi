unit uMatrixTest;

interface
uses
  DUnitX.TestFramework, uMatrix,
  System.Generics.Collections;

type

  [TestFixture]
  TMatrixTest = class(TObject)
  private
    ExpectedRow : TList<integer>;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;

    [Test]
//    [Ignore('Comment the "[Ignore]" statement to run the test')]
    procedure extract_row_from_one_number_matrix;

    [Test]
    [Ignore]
    procedure can_extract_row;

    [Test]
    [Ignore]
    procedure extract_row_where_numbers_have_different_widths;

    [Test]
    [Ignore]
    procedure can_extract_row_from_non_square_matrix;

    [Test]
    [Ignore]
    procedure extract_column_from_one_number_matrix;

    [Test]
    [Ignore]
    procedure can_extract_column;

    [Test]
    [Ignore]
    procedure can_extract_column_from_non_square_matrix;

    [Test]
    [Ignore]
    procedure extract_column_where_numbers_have_different_widths;
  end;

implementation

procedure TMatrixTest.can_extract_column;
var Expected, Actual : TArray<integer>;
  i: Integer;
begin
  ExpectedRow.AddRange([3, 6, 9]);
  Expected := ExpectedRow.ToArray;
  Actual := Matrix.Create('1 2 3\n4 5 6\n7 8 9').column(2);
  Assert.AreEqual(Length(Expected), Length(Actual));
  for i := Low(expected) to High(expected) do
    Assert.AreEqual(expected[i], Actual[i]);
end;

procedure TMatrixTest.can_extract_column_from_non_square_matrix;
var Expected, Actual : TArray<integer>;
  i: Integer;
begin
  ExpectedRow.AddRange([3, 6, 9, 6]);
  Expected := ExpectedRow.ToArray;
  Actual := Matrix.Create('1 2 3\n4 5 6\n7 8 9\n8 7 6').column(2);
  Assert.AreEqual(Length(Expected), Length(Actual));
  for i := Low(expected) to High(expected) do
    Assert.AreEqual(expected[i], Actual[i]);
end;

procedure TMatrixTest.can_extract_row;
var Expected, Actual : TArray<integer>;
  i: Integer;
begin
  ExpectedRow.AddRange([3, 4]);
  Expected := ExpectedRow.ToArray;
  Actual := Matrix.Create('1 2\n3 4').Row(1);
  Assert.AreEqual(Length(Expected), Length(Actual));
  for i := Low(expected) to High(expected) do
    Assert.AreEqual(expected[i], Actual[i]);
end;

procedure TMatrixTest.can_extract_row_from_non_square_matrix;
var Expected, Actual : TArray<integer>;
  i: Integer;
begin
  ExpectedRow.AddRange([7, 8, 9]);
  Expected := ExpectedRow.ToArray;
  Actual := Matrix.Create('1 2 3\n4 5 6\n7 8 9\n8 7 6').Row(2);
  Assert.AreEqual(Length(Expected), Length(Actual));
  for i := Low(expected) to High(expected) do
    Assert.AreEqual(expected[i], Actual[i]);

end;

procedure TMatrixTest.extract_column_from_one_number_matrix;
var Expected, Actual : TArray<integer>;
  i: Integer;
begin
  ExpectedRow.AddRange([1]);
  Expected := ExpectedRow.ToArray;
  Actual := Matrix.Create('1').column(0);
  Assert.AreEqual(Length(Expected), Length(Actual));
  for i := Low(expected) to High(expected) do
    Assert.AreEqual(expected[i], Actual[i]);
end;

procedure TMatrixTest.extract_column_where_numbers_have_different_widths;
var Expected, Actual : TArray<integer>;
  i: Integer;
begin
  ExpectedRow.AddRange([1903, 3, 4]);
  Expected := ExpectedRow.ToArray;
  Actual := Matrix.Create('89 1903 3\n18 3 1\n9 4 800').column(1);
  Assert.AreEqual(Length(Expected), Length(Actual));
  for i := Low(expected) to High(expected) do
    Assert.AreEqual(expected[i], Actual[i]);
end;

procedure TMatrixTest.extract_row_from_one_number_matrix;
var Expected, Actual : TArray<integer>;
  i: Integer;
begin
  ExpectedRow.AddRange([1]);
  Expected := ExpectedRow.ToArray;
  Actual := Matrix.Create('1').Row(0);
  Assert.AreEqual(Length(Expected), Length(Actual));
  for i := Low(expected) to High(expected) do
    Assert.AreEqual(expected[i], Actual[i]);
end;

procedure TMatrixTest.extract_row_where_numbers_have_different_widths;
var Expected, Actual : TArray<integer>;
  i: Integer;
begin
  ExpectedRow.AddRange([10, 20]);
  Expected := ExpectedRow.ToArray;
  Actual := Matrix.Create('1 2\n10 20').Row(1);
  Assert.AreEqual(Length(Expected), Length(Actual));
  for i := Low(expected) to High(expected) do
    Assert.AreEqual(expected[i], Actual[i]);
end;

procedure TMatrixTest.Setup;
begin
  ExpectedRow := TList<integer>.Create;
end;

procedure TMatrixTest.TearDown;
begin
  ExpectedRow.DisposeOf;
end;

initialization
  TDUnitX.RegisterTestFixture(TMatrixTest);
end.
