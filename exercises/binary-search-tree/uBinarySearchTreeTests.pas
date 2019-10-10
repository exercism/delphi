unit uBinarySearchTreeTests;

interface
uses
  DUnitX.TestFramework, uBinarySearchTree;

const
  CanonicalVersion = '1.0.0.1';

type

  [TestFixture]
  TBinarySearchTreeTest = class(TObject)
  private
    FBSTree: TBinarySearchTree;
    procedure CompareArrays(Array1, Array2: TArray<string>);
  public
    [TearDown]
    procedure TearDown;

    [Test]
//    [Ignore('Comment the "[Ignore]" statement to run the test')]
    procedure data_is_retained;

    [Test]
    [Ignore]
    procedure smaller_number_at_left_node;

    [Test]
    [Ignore]
    procedure same_number_at_left_node;

    [Test]
    [Ignore]
    procedure greater_number_at_right_node;

    [Test]
    [Ignore]
    procedure can_create_complex_tree;

    [Test]
    [Ignore]
    procedure can_sort_single_number;

    [Test]
    [Ignore]
    procedure can_sort_if_second_number_is_smaller_than_first;

    [Test]
    [Ignore]
    procedure can_sort_if_second_number_is_same_as_first;

    [Test]
    [Ignore]
    procedure can_sort_if_second_number_is_greater_than_first;

    [Test]
    [Ignore]
    procedure can_sort_complex_tree;
  end;

implementation

uses
  System.SysUtils;

procedure TBinarySearchTreeTest.can_create_complex_tree;
begin
  FBSTree := TBinarySearchTree.Create(['4', '2', '6', '1', '3', '5', '7']);
  Assert.AreEqual('4', FBSTree.Data);
  Assert.AreEqual('2', FBSTree.Left.Data);
  Assert.AreEqual('1', FBSTree.Left.Left.Data);
  Assert.AreEqual('3', FBSTree.Left.Right.Data);
  Assert.AreEqual('6', FBSTree.Right.Data);
  Assert.AreEqual('5', FBSTree.Right.Left.Data);
  Assert.AreEqual('7', FBSTree.Right.Right.Data);
end;

procedure TBinarySearchTreeTest.can_sort_complex_tree;
begin
  FBSTree := TBinarySearchTree.Create(['2', '1', '3', '6', '7', '5']);
  CompareArrays(['1', '2', '3', '5', '6', '7'], FBSTree.SortedData);
end;

procedure TBinarySearchTreeTest.can_sort_if_second_number_is_greater_than_first;
begin
  FBSTree := TBinarySearchTree.Create(['2', '3']);
  CompareArrays(['2', '3'], FBSTree.SortedData);
end;

procedure TBinarySearchTreeTest.can_sort_if_second_number_is_same_as_first;
begin
  FBSTree := TBinarySearchTree.Create(['2', '2']);
  CompareArrays(['2', '2'], FBSTree.SortedData);
end;

procedure TBinarySearchTreeTest.can_sort_if_second_number_is_smaller_than_first;
begin
  FBSTree := TBinarySearchTree.Create(['4', '2']);
  CompareArrays(['2', '4'], FBSTree.SortedData);
end;

procedure TBinarySearchTreeTest.can_sort_single_number;
begin
  FBSTree := TBinarySearchTree.Create(['4']);
  CompareArrays(['4'], FBSTree.SortedData);
end;

procedure TBinarySearchTreeTest.CompareArrays(Array1, Array2: TArray<string>);
var
  i: integer;
begin
  Assert.AreEqual(Length(Array1), Length(Array2), ' - Array lengths must be equal');
  for i := Low(Array1) to High(Array1) do
    Assert.AreEqual(Array1[i], Array2[i], format('Expecting element %d to = %s, Actual = %s',
      [i, Array1[i], Array2[i]]));
end;

procedure TBinarySearchTreeTest.data_is_retained;
begin
  FBSTree := TBinarySearchTree.Create(['4']);
  Assert.AreEqual('4', FBSTree.Data);
end;

procedure TBinarySearchTreeTest.greater_number_at_right_node;
begin
  FBSTree := TBinarySearchTree.Create(['4', '5']);
  Assert.AreEqual('4', FBSTree.Data);
  Assert.AreEqual('5', FBSTree.Right.Data);
end;

procedure TBinarySearchTreeTest.same_number_at_left_node;
begin
  FBSTree := TBinarySearchTree.Create(['4', '4']);
  Assert.AreEqual('4', FBSTree.Data);
  Assert.AreEqual('4', FBSTree.Left.Data);
end;

procedure TBinarySearchTreeTest.smaller_number_at_left_node;
begin
  FBSTree := TBinarySearchTree.Create(['4', '2']);
  Assert.AreEqual('4', FBSTree.Data);
  Assert.AreEqual('2', FBSTree.Left.Data);
end;

procedure TBinarySearchTreeTest.TearDown;
begin
  FBSTree.Free;
end;

initialization
  TDUnitX.RegisterTestFixture(TBinarySearchTreeTest);
end.
