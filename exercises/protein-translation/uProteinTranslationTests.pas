unit uProteinTranslationTests;

interface
uses
  DUnitX.TestFramework, System.SysUtils, uProteinTranslation;

const
  CanonicalVersion = '1.1.1.1';

type
  [TestFixture]
  TProteinTranslationTest = class(TObject)
  private
    procedure CompareArrays(Array1, Array2: TArray<string>);
  public
    [Test]
//    [Ignore('Comment the "[Ignore]" statement to run the test')]
    procedure Methionine_RNA_sequence;

    [Test]
    [Ignore]
    procedure Phenylalanine_RNA_sequence;

    [Test]
    [Ignore]
    procedure Phenylalanine_RNA_sequence_2;

    [Test]
    [Ignore]
    procedure Leucine_RNA_sequence;

    [Test]
    [Ignore]
    procedure Leucine_RNA_sequence_2;

    [Test]
    [Ignore]
    procedure Serine_RNA_sequence;

    [Test]
    [Ignore]
    procedure Serine_RNA_sequence_2;

    [Test]
    [Ignore]
    procedure Serine_RNA_sequence_3;

    [Test]
    [Ignore]
    procedure Serine_RNA_sequence_4;

    [Test]
    [Ignore]
    procedure Tyrosine_RNA_sequence;

    [Test]
    [Ignore]
    procedure Tyrosine_RNA_sequence_2;

    [Test]
    [Ignore]
    procedure Cysteine_RNA_sequence;

    [Test]
    [Ignore]
    procedure Cysteine_RNA_sequence_2;

    [Test]
    [Ignore]
    procedure Tryptophan_RNA_sequence;

    [Test]
    [Ignore]
    procedure STOP_codon_RNA_sequence;

    [Test]
    [Ignore]
    procedure STOP_codon_RNA_sequence_2;

    [Test]
    [Ignore]
    procedure STOP_codon_RNA_sequence_3;

    [Test]
    [Ignore]
    procedure Translate_RNA_strand_into_correct_protein_list;

    [Test]
    [Ignore]
    procedure Translation_stops_if_STOP_codon_at_beginning_of_sequence;

    [Test]
    [Ignore]
    procedure Translation_stops_if_STOP_codon_at_end_of_two_codon_sequence;

    [Test]
    [Ignore]
    procedure Translation_stops_if_STOP_codon_at_end_of_three_codon_sequence;

    [Test]
    [Ignore]
    procedure Translation_stops_if_STOP_codon_in_middle_of_three_codon_sequence;

    [Test]
    [Ignore]
    procedure Translation_stops_if_STOP_codon_in_middle_of_six_codon_sequence;
  end;

implementation

procedure TProteinTranslationTest.CompareArrays(Array1, Array2: TArray<string>);
var
  i: integer;
begin
  Assert.AreEqual(Length(Array1), Length(Array2), ' - Arrays doesn''t have same length');
  for i := Low(Array1) to High(Array1) do
    Assert.AreEqual(Array1[i], Array2[i], format(' - on [%d] place of array', [i]));
end;

procedure TProteinTranslationTest.Cysteine_RNA_sequence;
begin
  CompareArrays(['Cysteine'], TProteinTranslation.Proteins('UGU'));
end;

procedure TProteinTranslationTest.Cysteine_RNA_sequence_2;
begin
  CompareArrays(['Cysteine'], TProteinTranslation.Proteins('UGC'));
end;

procedure TProteinTranslationTest.Leucine_RNA_sequence;
begin
  CompareArrays(['Leucine'], TProteinTranslation.Proteins('UUA'));
end;

procedure TProteinTranslationTest.Leucine_RNA_sequence_2;
begin
  CompareArrays(['Leucine'], TProteinTranslation.Proteins('UUG'));
end;

procedure TProteinTranslationTest.Methionine_RNA_sequence;
begin
  CompareArrays(['Methionine'], TProteinTranslation.Proteins('AUG'));
end;

procedure TProteinTranslationTest.Phenylalanine_RNA_sequence;
begin
  CompareArrays(['Phenylalanine'], TProteinTranslation.Proteins('UUU'));
end;

procedure TProteinTranslationTest.Phenylalanine_RNA_sequence_2;
begin
  CompareArrays(['Phenylalanine'], TProteinTranslation.Proteins('UUC'));
end;

procedure TProteinTranslationTest.Serine_RNA_sequence;
begin
  CompareArrays(['Serine'], TProteinTranslation.Proteins('UCU'));
end;

procedure TProteinTranslationTest.Serine_RNA_sequence_2;
begin
  CompareArrays(['Serine'], TProteinTranslation.Proteins('UCC'));
end;

procedure TProteinTranslationTest.Serine_RNA_sequence_3;
begin
  CompareArrays(['Serine'], TProteinTranslation.Proteins('UCA'));
end;

procedure TProteinTranslationTest.Serine_RNA_sequence_4;
begin
  CompareArrays(['Serine'], TProteinTranslation.Proteins('UCG'));
end;

procedure TProteinTranslationTest.STOP_codon_RNA_sequence;
begin
  CompareArrays([], TProteinTranslation.Proteins('UAA'));
end;

procedure TProteinTranslationTest.STOP_codon_RNA_sequence_2;
begin
  CompareArrays([], TProteinTranslation.Proteins('UAG'));
end;

procedure TProteinTranslationTest.STOP_codon_RNA_sequence_3;
begin
  CompareArrays([], TProteinTranslation.Proteins('UGA'));
end;

procedure TProteinTranslationTest.Translate_RNA_strand_into_correct_protein_list;
begin
  CompareArrays(['Methionine', 'Phenylalanine', 'Tryptophan'], TProteinTranslation.Proteins('AUGUUUUGG'));
end;

procedure TProteinTranslationTest.Translation_stops_if_STOP_codon_at_beginning_of_sequence;
begin
  CompareArrays([], TProteinTranslation.Proteins('UAGUGG'));
end;

procedure TProteinTranslationTest.Translation_stops_if_STOP_codon_at_end_of_three_codon_sequence;
begin
  CompareArrays(['Methionine', 'Phenylalanine'], TProteinTranslation.Proteins('AUGUUUUAA'));
end;

procedure TProteinTranslationTest.Translation_stops_if_STOP_codon_at_end_of_two_codon_sequence;
begin
  CompareArrays(['Tryptophan'], TProteinTranslation.Proteins('UGGUAG'));
end;

procedure TProteinTranslationTest.Translation_stops_if_STOP_codon_in_middle_of_six_codon_sequence;
begin
  CompareArrays(['Tryptophan', 'Cysteine', 'Tyrosine'], TProteinTranslation.Proteins('UGGUGUUAUUAAUGGUUU'));
end;

procedure TProteinTranslationTest.Translation_stops_if_STOP_codon_in_middle_of_three_codon_sequence;
begin
  CompareArrays(['Tryptophan'], TProteinTranslation.Proteins('UGGUAGUGG'));
end;

procedure TProteinTranslationTest.Tryptophan_RNA_sequence;
begin
  CompareArrays(['Tryptophan'], TProteinTranslation.Proteins('UGG'));
end;

procedure TProteinTranslationTest.Tyrosine_RNA_sequence;
begin
  CompareArrays(['Tyrosine'], TProteinTranslation.Proteins('UAU'));
end;

procedure TProteinTranslationTest.Tyrosine_RNA_sequence_2;
begin
  CompareArrays(['Tyrosine'], TProteinTranslation.Proteins('UAC'));
end;

initialization
  TDUnitX.RegisterTestFixture(TProteinTranslationTest);
end.
