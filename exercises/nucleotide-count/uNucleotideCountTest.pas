unit uNucleotideCountTest;

interface
uses
  DUnitX.TestFramework,  System.Generics.Collections;

type

  [TestFixture]
  NucleoTideCountTest = class(TObject)
  private
    procedure CompareDictionaries(Expected, Actual: TDictionary<char, integer>);
  public
    [Test]
    procedure Validate_CompareDictionaries;

    [Test]
    procedure Has_no_nucleotides;

    [Test]
    [Ignore('Comment this line to run this test')]
    procedure Has_no_adenosine;

    [Test]
    [Ignore('Comment this line to run this test')]
    procedure Repetitive_cytidine_gets_counts;

    [Test]
    [Ignore('Comment this line to run this test')]
    procedure Repetitive_sequence_has_only_guanosine;

    [Test]
    [Ignore('Comment this line to run this test')]
    procedure Counts_only_thymidine;

    [Test]
    [Ignore('Comment this line to run this test')]
    procedure Counts_a_nucleotide_only_once;

    [Test]
    [Ignore('Comment this line to run this test')]
    procedure Validates_nucleotides;

    [Test]
    [Ignore('Comment this line to run this test')]
    procedure Counts_all_nucleotides;
  end;

implementation
uses SysUtils, uNucleotideCount;

procedure NucleoTideCountTest.CompareDictionaries(Expected, Actual: TDictionary<Char, Integer>);
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

procedure NucleoTideCountTest.Has_no_nucleotides;
var dna: IDNA;
    expected: TDictionary<char, integer>;
begin
  expected := TDictionary<char, integer>.Create;
  expected.Add('A',0);
  expected.Add('T',0);
  expected.Add('C',0);
  expected.Add('G',0);

  dna := NewDNA('');

  CompareDictionaries(expected, dna.NucleotideCounts);
end;

procedure NucleoTideCountTest.Has_no_adenosine;
var dna: IDNA;
    inStr: string;
begin
  inStr := '';
  dna := NewDNA(inStr);

  Assert.AreEqual(length(inStr), dna.Count('A'));
end;

procedure NucleoTideCountTest.Repetitive_cytidine_gets_counts;
var dna: IDNA;
    inStr: string;
begin
  inStr := 'CCCCC';
  dna := NewDNA(inStr);

  Assert.AreEqual(length(inStr), dna.Count('C'));
end;

procedure NucleoTideCountTest.Repetitive_sequence_has_only_guanosine;
var dna: IDNA;
    expected: TDictionary<char, integer>;
    inStr: string;
begin
  expected := TDictionary<char, integer>.Create();
  expected.Add('A',0);
  expected.Add('T',0);
  expected.Add('C',0);
  expected.Add('G',8);
  inStr := 'GGGGGGGG';

  dna := NewDNA(inStr);

  CompareDictionaries(expected, dna.NucleotideCounts);
end;

procedure NucleoTideCountTest.Counts_only_thymidine;
var dna: IDNA;
    inStr: string;
begin
  inStr := 'GGGGTAACCCGG';
  dna := NewDNA(inStr);

  Assert.AreEqual(length('T'), dna.Count('T'));
end;

procedure NucleoTideCountTest.Counts_a_nucleotide_only_once;
var dna: IDNA;
    inStr: string;
begin
  inStr := 'GGTTGG';
  dna := NewDNA(inStr);
  dna.Count('T');

  Assert.AreEqual(2, dna.Count('T'));
end;

procedure NucleoTideCountTest.Validates_nucleotides;
var MyProc: TTestLocalMethod;
begin
  MyProc := procedure
            var dna: IDNA;
                inStr: string;
            begin
              inStr := 'GGTTGG';
              dna := NewDNA(inStr);
              dna.Count('X');
            end;

  Assert.WillRaise(MyProc, EInvalidNucleotideException);
end;

procedure NucleoTideCountTest.Counts_all_nucleotides;
var dna: IDNA;
    expected: TDictionary<char, integer>;
    inStr: string;
begin
  expected := TDictionary<char, integer>.Create;
  expected.Add('A',20);
  expected.Add('T',21);
  expected.Add('C',12);
  expected.Add('G',17);
  inStr := 'AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC';

  dna := NewDNA(inStr);

  CompareDictionaries(expected, dna.NucleotideCounts);
end;

initialization
  TDUnitX.RegisterTestFixture(NucleoTideCountTest);
end.
