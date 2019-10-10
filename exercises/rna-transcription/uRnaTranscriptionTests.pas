unit uRnaTranscriptionTests;

interface
uses
  DUnitX.TestFramework;

const
  CanonicalVersion = '1.3.0.1';

type
  [TestFixture]
  RnaTranscriptionTest = class(TObject)
  public
    [Test]
//    [Ignore('Comment the "[Ignore]" statement to run the test')]
    procedure Empty_RNA_sequence;

    [Test]
    [Ignore]
    procedure Rna_complement_of_cytosine_is_guanine;

    [Test]
    [Ignore]
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

procedure RnaTranscriptionTest.Empty_RNA_sequence;
begin
  Assert.AreEqual('', complement.OfDna(''));
end;

procedure RnaTranscriptionTest.Rna_complement;
begin
  Assert.AreEqual('UGCACCAGAAUU', complement.OfDna('ACGTGGTCTTAA'));
end;

initialization
  TDUnitX.RegisterTestFixture(RnaTranscriptionTest);
end.
