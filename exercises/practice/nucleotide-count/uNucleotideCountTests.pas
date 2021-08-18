unit uNucleotideCountTests;

interface
uses
  DUnitX.TestFramework, System.Generics.Collections;

const
  CanonicalVersion = '1.3.0.2';

type

  [TestFixture('count all nucleotides in a strand')]
  NucleoTideCountTest = class(TObject)
  public
    [Test]
    procedure Validate_CompareDictionaries;

    [Test]
//    [Ignore('Comment the "[Ignore]" statement to run the test')]
    procedure empty_strand;

    [Test]
    [Ignore]
    procedure can_count_one_nucleotide_in_single_character_input;

    [Test]
    [Ignore]
    procedure strand_with_repeated_nucleotide;

    [Test]
    [Ignore]
    procedure strand_with_multiple_nucleotides;

    [Test]
    [Ignore]
    procedure strand_with_invalid_nucleotides;
  end;

implementation

uses
  SysUtils,
  uNucleotideCount;

procedure CompareDictionaries(Expected, Actual: TDictionary<Char, Integer>);
var
  expectedItem: TPair<char, integer>;
begin
  Assert.AreEqual(Expected.Count, Actual.Count); //Actual should have 4 nucleotides as expected
  for expectedItem in Expected do
  begin  //Every Actual item should match an expected item.
    Assert.IsTrue(Actual.ContainsKey(expectedItem.Key));
    Assert.AreEqual(expectedItem.Value, Actual[expectedItem.Key]);
  end;
end;

procedure NucleoTideCountTest.Validate_CompareDictionaries;
var
  expected, actual: TDictionary<char, integer>;
begin
  expected := TDictionary<char, integer>.Create;
  try
    expected.Add('r',5);
    expected.Add('a',10);
    expected.Add('n',15);
    expected.Add('d',20);
    expected.Add('o',25);
    expected.Add('m',30);

    actual := TDictionary<char, integer>.create(expected);
    try
      CompareDictionaries(expected, actual);
    finally
      actual.Free;
    end;
  finally
    expected.Free;
  end;
end;

procedure NucleoTideCountTest.empty_strand;
var
  dna: TDNA;
  expected: TDictionary<char, integer>;
begin
  expected := TDictionary<char, integer>.Create;
  dna := TDNA.Create('');
  try
    expected.Add('A',0);
    expected.Add('T',0);
    expected.Add('C',0);
    expected.Add('G',0);

    CompareDictionaries(expected, dna.NucleotideCounts);
  finally
    dna.Free;
    expected.Free;
  end;
end;

procedure NucleoTideCountTest.strand_with_repeated_nucleotide;
var
  dna: TDNA;
  expected: TDictionary<char, integer>;
  inStr: string;
begin
  expected := TDictionary<char, integer>.Create();
  inStr := 'GGGGGGG';
  dna := TDNA.Create(inStr);
  try
    expected.Add('A',0);
    expected.Add('T',0);
    expected.Add('C',0);
    expected.Add('G',7);
    CompareDictionaries(expected, dna.NucleotideCounts);
  finally
    dna.Free;
    expected.Free;
  end;
end;

procedure NucleoTideCountTest.strand_with_invalid_nucleotides;
var
  MyProc: TTestLocalMethod;
  dna: TDNA;
begin
  MyProc := procedure
            var
              inStr: string;
            begin
              inStr := 'AGXXACT';
              dna := TDNA.Create(inStr);
            end;

  try
    Assert.WillRaiseWithMessage(MyProc,EInvalidNucleotideException,'Invalid nucleotide in strand');
  finally
    dna.Free;
  end;
end;

procedure NucleoTideCountTest.can_count_one_nucleotide_in_single_character_input;
var
  dna: TDNA;
  expected: TDictionary<char, integer>;
  inStr: string;
begin
  expected := TDictionary<char, integer>.Create;
  inStr := 'G';
  dna := TDNA.Create(inStr);
  try
    expected.Add('A',0);
    expected.Add('T',0);
    expected.Add('C',0);
    expected.Add('G',1);
    CompareDictionaries(expected, dna.NucleotideCounts);
  finally
    dna.Free;
    expected.Free;
  end;
end;

procedure NucleoTideCountTest.strand_with_multiple_nucleotides;
var
  dna: TDNA;
  expected: TDictionary<char, integer>;
  inStr: string;
begin
  expected := TDictionary<char, integer>.Create;
  inStr := 'AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC';
  dna := TDNA.Create(inStr);
  try
    expected.Add('A',20);
    expected.Add('T',21);
    expected.Add('C',12);
    expected.Add('G',17);

    CompareDictionaries(expected, dna.NucleotideCounts);
  finally
    dna.Free;
    expected.Free;
  end;
end;

initialization
  TDUnitX.RegisterTestFixture(NucleoTideCountTest);
end.

