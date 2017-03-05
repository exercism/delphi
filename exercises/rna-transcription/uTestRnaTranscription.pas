unit uTestRnaTranscription;

interface
uses
  DUnitX.TestFramework;

type
  [TestFixture]
  RnaTranscriptionTest = class(TObject)
  public
    [Test]
    procedure Rna_complement_of_cytosine_is_guanine;

    [Test]
    [Ignore('Comment these lines to run these tests')]
    procedure Rna_complement_of_guanine_is_cytosine;

    [Test]
    [Ignore]
    procedure Rna_complement_of_thymine_is_adenine;

    [Test]
    [Ignore]
    procedure Rna_complement_of_adenine_is_uracil;

    [Test]
    [Ignore]
    procedure Rna_complement;

    [Test]
    [Ignore]
    procedure Dna_correctly_handles_invalid_input;

    [Test]
    [Ignore]
    procedure Dna_correctly_handles_completely_invalid_input;

    [Test]
    [Ignore]
    procedure Dna_correctly_handles_partially_invalid_input;
  end;

implementation
uses uRnaTranscription;

procedure RnaTranscriptionTest.Rna_complement_of_cytosine_is_guanine;
begin
  Assert.AreEqual('G', complement.OfDna('C'));
end;

procedure RnaTranscriptionTest.Rna_complement_of_guanine_is_cytosine;
begin
  Assert.AreEqual('C', complement.OfDna('G'));
end;

procedure RnaTranscriptionTest.Rna_complement_of_thymine_is_adenine;
begin
  Assert.AreEqual('A', complement.OfDna('T'));
end;

procedure RnaTranscriptionTest.Rna_complement_of_adenine_is_uracil;
begin
  Assert.AreEqual('U', complement.OfDna('A'));
end;

procedure RnaTranscriptionTest.Rna_complement;
begin
  Assert.AreEqual('UGCACCAGAAUU', complement.OfDna('ACGTGGTCTTAA'));
end;

procedure RnaTranscriptionTest.Dna_correctly_handles_invalid_input;
begin
  Assert.AreEqual('', complement.OfDna('U'));
end;

procedure RnaTranscriptionTest.Dna_correctly_handles_completely_invalid_input;
begin
  Assert.AreEqual('', complement.OfDna('XXX'));
end;

procedure RnaTranscriptionTest.Dna_correctly_handles_partially_invalid_input;
begin
  Assert.AreEqual('', complement.OfDna('ACGTXXXCTTAA'));
end;

initialization
  TDUnitX.RegisterTestFixture(RnaTranscriptionTest);
end.
