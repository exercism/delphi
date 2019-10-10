unit uMatrixTests;

interface

uses
  DUnitX.TestFramework, System.Generics.Collections;

const
  CanonicalVersion = '1.1.0.1';

type

  [TestFixture]
  TMatrixTest = class(TObject)
  private
    ExpectedRow : TList<integer>;
    procedure CompareArrays(Array1, Array2: TArray<integer>);
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
uses uMatrix;

procedure TMatrixTest.can_extract_column;
var
  CUT: TMatrix;
  Expected, Actual : TArray<integer>;
  i: Integer;
begin
  ExpectedRow.AddRange([3, 6, 9]);
  Expected := ExpectedRow.ToArray;
  CUT := TMatrix.Create('1 2 3\n4 5 6\n7 8 9');
  Actual := CUT.column(3);
  CompareArrays(Expected, Actual);
end;

procedure TMatrixTest.can_extract_column_from_non_square_matrix;
var
  CUT: TMatrix;
  Expected, Actual : TArray<integer>;
  i: Integer;
begin
  ExpectedRow.AddRange([3, 6, 9, 6]);
  Expected := ExpectedRow.ToArray;
  CUT := TMatrix.Create('1 2 3\n4 5 6\n7 8 9\n8 7 6');
  Actual := CUT.column(3);
  CompareArrays(Expected, Actual);
end;

procedure TMatrixTest.can_extract_row;
var
  CUT: TMatrix;
  Expected, Actual : TArray<integer>;
  i: Integer;
begin
  ExpectedRow.AddRange([3, 4]);
  Expected := ExpectedRow.ToArray;
  CUT := TMatrix.Create('1 2\n3 4');
  Actual := CUT.Row(2);
  CompareArrays(Expected, Actual);
end;

procedure TMatrixTest.can_extract_row_from_non_square_matrix;
var
  CUT: TMatrix;
  Expected, Actual : TArray<integer>;
  i: Integer;
begin
  ExpectedRow.AddRange([7, 8, 9]);
  Expected := ExpectedRow.ToArray;
  CUT := TMatrix.Create('1 2 3\n4 5 6\n7 8 9\n8 7 6');
  Actual := CUT.Row(3);
  CompareArrays(Expected, Actual);
end;

procedure TMatrixTest.extract_column_from_one_number_matrix;
var
  CUT: TMatrix;
  Expected, Actual : TArray<integer>;
  i: Integer;
begin
  ExpectedRow.AddRange([1]);
  Expected := ExpectedRow.ToArray;
  CUT := TMatrix.Create('1');
  Actual := CUT.column(1);
  CompareArrays(Expected, Actual);
end;

procedure TMatrixTest.extract_column_where_numbers_have_different_widths;
var
  CUT: TMatrix;
  Expected, Actual : TArray<integer>;
  i: Integer;
begin
  ExpectedRow.AddRange([1903, 3, 4]);
  Expected := ExpectedRow.ToArray;
  CUT := TMatrix.Create('89 1903 3\n18 3 1\n9 4 800');
  Actual := CUT.column(2);
  CompareArrays(Expected, Actual);
end;

procedure TMatrixTest.extract_row_from_one_number_matrix;
var
  CUT: TMatrix;
  Expected, Actual : TArray<integer>;
  i: Integer;
begin
  ExpectedRow.AddRange([1]);
  Expected := ExpectedRow.ToArray;
  CUT := TMatrix.Create('1');
  Actual := CUT.Row(1);
  CompareArrays(Expected, Actual);
end;

procedure TMatrixTest.extract_row_where_numbers_have_different_widths;
var
  CUT: TMatrix;
  Expected, Actual : TArray<integer>;
  i: Integer;
begin
  ExpectedRow.AddRange([10, 20]);
  Expected := ExpectedRow.ToArray;
  CUT := TMatrix.Create('1 2\n10 20');
  Actual := CUT.Row(2);
  CompareArrays(Expected, Actual);
end;

procedure TMatrixTest.CompareArrays(Array1, Array2: TArray<integer>);
var
  i: integer;
begin
  Assert.AreEqual(Length(Array1), Length(Array2));
  for i := Low(Array1) to High(Array1) do
    Assert.AreEqual(Array1[i], Array2[i]);
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
