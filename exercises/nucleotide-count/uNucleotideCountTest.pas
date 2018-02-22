unit uNucleotideCountTest;

interface
uses
  DUnitX.TestFramework, System.Generics.Collections;

const
  CanonicalVersion = '1.3.0';

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
uses SysUtils, uNucleotideCount;

procedure CompareDictionaries(Expected, Actual: TDictionary<Char, Integer>);
var expectedArray,
    actualArray: TArray<TPair<char, integer>>;
    i: integer;
begin
  Assert.AreEqual(Expected.Count, Actual.Count);
  expectedArray := Expected.ToArray;
  actualArray := Actual.ToArray;
  for i := Low(expectedArray) to High(expectedArray) do
  begin
    Assert.AreEqual(expectedArray[i].Key, actualArray[i].Key,'Keys don''t match');
    Assert.AreEqual(expectedArray[i].Value, actualArray[i].Value, format('Key %s count is wrong',[expectedArray[i].Key]));
  end;
end;

procedure NucleoTideCountTest.Validate_CompareDictionaries;
var expected, actual: TDictionary<char, integer>;
begin
  expected := TDictionary<char, integer>.Create;
  expected.Add('r',5);
  expected.Add('a',10);
  expected.Add('n',15);
  expected.Add('d',20);
  expected.Add('o',25);
  expected.Add('m',30);

  actual := TDictionary<char, integer>.create(expected);

  CompareDictionaries(expected, actual);
end;

procedure NucleoTideCountTest.empty_strand;
var dna: TDNA;
    expected: TDictionary<char, integer>;
begin
  expected := TDictionary<char, integer>.Create;
  expected.Add('A',0);
  expected.Add('T',0);
  expected.Add('C',0);
  expected.Add('G',0);

  dna := TDNA.Create('');

  CompareDictionaries(expected, dna.NucleotideCounts);
end;

procedure NucleoTideCountTest.strand_with_repeated_nucleotide;
var dna: TDNA;
    expected: TDictionary<char, integer>;
    inStr: string;
begin
  expected := TDictionary<char, integer>.Create();
  expected.Add('A',0);
  expected.Add('T',0);
  expected.Add('C',0);
  expected.Add('G',7);
  inStr := 'GGGGGGG';

  dna := TDNA.Create(inStr);

  CompareDictionaries(expected, dna.NucleotideCounts);
end;

procedure NucleoTideCountTest.strand_with_invalid_nucleotides;
var MyProc: TTestLocalMethod;
begin
  MyProc := procedure
            var dna: TDNA;
                inStr: string;
            begin
              inStr := 'AGXXACT';
              dna := TDNA.Create(inStr);
              dna.Count('X');
            end;
  Assert.WillRaiseWithMessage(MyProc,EInvalidNucleotideException,'Invalid nucleotide in strand');
end;

procedure NucleoTideCountTest.can_count_one_nucleotide_in_single_character_input;
var dna: TDNA;
    expected: TDictionary<char, integer>;
    inStr: string;
begin
  expected := TDictionary<char, integer>.Create;
  expected.Add('A',0);
  expected.Add('T',0);
  expected.Add('C',0);
  expected.Add('G',1);
  inStr := 'G';

  dna := TDNA.Create(inStr);

  CompareDictionaries(expected, dna.NucleotideCounts);
end;

procedure NucleoTideCountTest.strand_with_multiple_nucleotides;
var dna: TDNA;
    expected: TDictionary<char, integer>;
    inStr: string;
begin
  expected := TDictionary<char, integer>.Create;
  expected.Add('A',20);
  expected.Add('T',21);
  expected.Add('C',12);
  expected.Add('G',17);
  inStr := 'AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC';

  dna := TDNA.Create(inStr);

  CompareDictionaries(expected, dna.NucleotideCounts);
end;

initialization
  TDUnitX.RegisterTestFixture(NucleoTideCountTest);
end.
