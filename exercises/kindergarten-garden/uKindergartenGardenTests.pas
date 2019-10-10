unit uKindergartenGardenTests;

interface
uses
  DUnitX.TestFramework, uKindergartenGarden;

const
  CanonicalVersion = '1.1.1.1';

type
  [TestFixture]
  TPartialGardenTest = class(TObject)
  private
    procedure CompareStringArrays(ExpectedArray, ActualArray : TArray<string>);
  public
    [Test]
//    [Ignore('Comment the "[Ignore]" statement to run the test')]
    procedure garden_with_single_student;

    [Test]
    [Ignore]
    procedure different_garden_with_single_student;

    [Test]
    [Ignore]
    procedure garden_with_two_students;

    [Test]
    [Ignore]
    procedure multiple_students_for_the_same_garden_with_three_students_second_students_garden;

    [Test]
    [Ignore]
    procedure multiple_students_for_the_same_garden_with_three_students_third_students_garden;

    [Test]
    [Ignore]
    procedure first_students_garden;

    [Test]
    [Ignore]
    procedure second_students_garden;

    [Test]
    [Ignore]
    procedure second_to_last_students_garden;

    [Test]
    [Ignore]
    procedure last_students_garden;
  end;

implementation

procedure TPartialGardenTest.CompareStringArrays(ExpectedArray,
  ActualArray: TArray<string>);
var
  i: integer;
begin
  Assert.AreEqual(Length(ExpectedArray), Length(ActualArray));
  for i := Low(ExpectedArray) to High(ExpectedArray) do
    Assert.AreEqual(ExpectedArray[i], ActualArray[i]);
end;

procedure TPartialGardenTest.different_garden_with_single_student;
var
  Garden : TGarden;
  ExpectedArray : TArray<string>;
begin
  ExpectedArray := ['violets', 'clover', 'radishes', 'clover'];
  Garden := TGarden.create('VC\nRC');
  CompareStringArrays(ExpectedArray, Garden.plants('Alice'));
end;

procedure TPartialGardenTest.garden_with_single_student;
var
  Garden : TGarden;
  ExpectedArray : TArray<string>;
begin
  ExpectedArray := ['radishes', 'clover', 'grass', 'grass'];
  Garden := TGarden.create('RC\nGG');
  CompareStringArrays(ExpectedArray, Garden.plants('Alice'));
end;

procedure TPartialGardenTest.garden_with_two_students;
var
  Garden : TGarden;
  ExpectedArray : TArray<string>;
begin
  ExpectedArray := ['clover', 'grass', 'radishes', 'clover'];
  Garden := TGarden.create('VVCG\nVVRC');
  CompareStringArrays(ExpectedArray, Garden.plants('Bob'));
end;

procedure TPartialGardenTest.multiple_students_for_the_same_garden_with_three_students_second_students_garden;
var
  Garden : TGarden;
  ExpectedArray : TArray<string>;
begin
  ExpectedArray := ['clover', 'clover', 'clover', 'clover'];
  Garden := TGarden.create('VVCCGG\nVVCCGG');
  CompareStringArrays(ExpectedArray, Garden.plants('Bob'));
end;

procedure TPartialGardenTest.multiple_students_for_the_same_garden_with_three_students_third_students_garden;
var
  Garden : TGarden;
  ExpectedArray : TArray<string>;
begin
  ExpectedArray := ['grass', 'grass', 'grass', 'grass'];
  Garden := TGarden.create('VVCCGG\nVVCCGG');
  CompareStringArrays(ExpectedArray, Garden.plants('Charlie'));
end;

procedure TPartialGardenTest.first_students_garden;
var
  Garden : TGarden;
  ExpectedArray : TArray<string>;
begin
  ExpectedArray := ['violets', 'radishes', 'violets', 'radishes'];
  Garden := TGarden.create('VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV');
  CompareStringArrays(ExpectedArray, Garden.plants('Alice'));
end;

procedure TPartialGardenTest.second_students_garden;
var
  Garden : TGarden;
  ExpectedArray : TArray<string>;
begin
  ExpectedArray := ['clover', 'grass', 'clover', 'clover'];
  Garden := TGarden.create('VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV');
  CompareStringArrays(ExpectedArray, Garden.plants('Bob'));
end;

procedure TPartialGardenTest.second_to_last_students_garden;
var
  Garden : TGarden;
  ExpectedArray : TArray<string>;
begin
  ExpectedArray := ['grass', 'clover', 'clover', 'grass'];
  Garden := TGarden.create('VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV');
  CompareStringArrays(ExpectedArray, Garden.plants('Kincaid'));
end;

procedure TPartialGardenTest.last_students_garden;
var
  Garden : TGarden;
  ExpectedArray : TArray<string>;
begin
  ExpectedArray := ['grass', 'violets', 'clover', 'violets'];
  Garden := TGarden.create('VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV');
  CompareStringArrays(ExpectedArray, Garden.plants('Larry'));
end;

initialization
  TDUnitX.RegisterTestFixture(TPartialGardenTest);
end.
