unit uAllergyTests;

interface
uses
  DUnitX.TestFramework;

type

  [TestFixture]
  AllergyTests = class(TObject) 
  public
    [Test]
    procedure No_allergies_means_not_allergic;

    [Test]
    [Ignore('Comment this line to run this test')]
    procedure Allergic_to_eggs;

    [Test]
    [Ignore('Comment this line to run this test')]
    procedure Allergic_to_eggs_in_addition_to_other_stuff;

    [Test]
    [Ignore('Comment this line to run this test')]
    procedure No_allergies_at_all;

    [Test]
    [Ignore('Comment this line to run this test')]
    procedure Allergic_to_just_eggs;

    [Test]
    [Ignore('Comment this line to run this test')]
    procedure Allergic_to_just_peanuts;

    [Test]
    [Ignore('Comment this line to run this test')]
    procedure Allergic_to_eggs_and_peanuts;

    [Test]
    [Ignore('Comment this line to run this test')]
    procedure Allergic_to_lots_of_stuff;

    [Test]
    [Ignore('Comment this line to run this test')]
    procedure Allergic_to_everything;

    [Test]
    [Ignore('Comment this line to run this test')]
    procedure Ignore_non_allergen_score_parts;
  end;

implementation
uses System.Generics.Collections, uAllergies;

procedure AllergyTests.No_allergies_means_not_allergic;
var allergies: IAllergies;
begin
  allergies := TAllergies.Create(0);
  assert.IsFalse(allergies.AllergicTo('peanuts'));
  assert.IsFalse(allergies.AllergicTo('cats'));
  assert.IsFalse(allergies.AllergicTo('strawberries'));
end;

procedure AllergyTests.Allergic_to_eggs;
var allergies: IAllergies;
begin
  allergies := TAllergies.Create(1);
  assert.IsTrue(allergies.AllergicTo('eggs'));
end;

procedure AllergyTests.Allergic_to_eggs_in_addition_to_other_stuff;
var allergies: IAllergies;
begin
  allergies := TAllergies.Create(5);
  assert.IsTrue(allergies.AllergicTo('eggs'));
  assert.IsTrue(allergies.AllergicTo('shellfish'));
  assert.IsFalse(allergies.AllergicTo('strawberries'));
end;

procedure AllergyTests.No_allergies_at_all;
var allergies: IAllergies;
begin
  allergies := TAllergies.Create(0);
  assert.AreEqual(0, allergies.IList.Count);
end;

procedure AllergyTests.Allergic_to_just_eggs;
var allergies: IAllergies;
begin
  allergies := TAllergies.Create(1);
  assert.AreEqual(1, allergies.IList.Count);
  assert.IsTrue(allergies.IList.Contains('eggs'));
end;

procedure AllergyTests.Allergic_to_just_peanuts;
var allergies: IAllergies;
begin
  allergies := TAllergies.Create(2);
  assert.AreEqual(1, allergies.IList.Count);
  assert.IsTrue(allergies.IList.Contains('peanuts'));
end;

procedure AllergyTests.Allergic_to_eggs_and_peanuts;
var allergies: IAllergies;
begin
  allergies := TAllergies.Create(3);
  assert.AreEqual(2, allergies.IList.Count);
  assert.IsTrue(allergies.IList.Contains('peanuts'));
  assert.IsTrue(allergies.IList.Contains('eggs'));
end;

procedure AllergyTests.Allergic_to_lots_of_stuff;
var allergies: IAllergies;
    Expected: TArray<string>;
    ExpectedCount: integer;
    ExpectedAllergen: string;
begin
  ExpectedCount := 5;
  SetLength(Expected, ExpectedCount);
  Expected[0] := 'strawberries';
  Expected[1] := 'tomatoes';
  Expected[2] := 'chocolate';
  Expected[3] := 'pollen';
  Expected[4] := 'cats';
  allergies := TAllergies.Create(248);
  assert.AreEqual(ExpectedCount, allergies.IList.Count);
  for ExpectedAllergen in Expected do
    assert.IsTrue(allergies.IList.Contains(ExpectedAllergen));
end;

procedure AllergyTests.Allergic_to_everything;
var allergies: IAllergies;
    Expected: TArray<string>;
    ExpectedCount: integer;
    ExpectedAllergen: string;
begin
  ExpectedCount := 8;
  SetLength(Expected, ExpectedCount);
  Expected[0] := 'eggs';
  Expected[1] := 'peanuts';
  Expected[2] := 'shellfish';
  Expected[3] := 'strawberries';
  Expected[4] := 'tomatoes';
  Expected[5] := 'chocolate';
  Expected[6] := 'pollen';
  Expected[7] := 'cats';
  allergies := TAllergies.Create(255);
  assert.AreEqual(ExpectedCount, allergies.IList.Count);
  for ExpectedAllergen in Expected do
    assert.IsTrue(allergies.IList.Contains(ExpectedAllergen));
end;

procedure AllergyTests.Ignore_non_allergen_score_parts;
var allergies: IAllergies;
    Expected: TArray<string>;
    ExpectedCount: integer;
    ExpectedAllergen: string;
begin
  ExpectedCount := 7;
  SetLength(Expected, ExpectedCount);
  Expected[0] := 'eggs';
  Expected[1] := 'shellfish';
  Expected[2] := 'strawberries';
  Expected[3] := 'tomatoes';
  Expected[4] := 'chocolate';
  Expected[5] := 'pollen';
  Expected[6] := 'cats';
  allergies := TAllergies.Create(509);
  assert.AreEqual(ExpectedCount, allergies.IList.Count);
  for ExpectedAllergen in Expected do
    assert.IsTrue(allergies.IList.Contains(ExpectedAllergen));
end;

initialization
  TDUnitX.RegisterTestFixture(AllergyTests);
end.
