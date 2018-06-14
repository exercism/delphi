unit uWordCountTests;

interface
uses
  System.Generics.Collections, DUnitX.TestFramework;

type

  [TestFixture]
  WordCountTests = class(TObject)
  private
    procedure CompareDictionaries(Expected, Actual: TDictionary<String, integer>);
  public
    [Test]
    procedure Validate_CompareDictionaries;
	
    [Test]
    [Ignore]

  end;
	
implementation

uses SysUtils, uWordCount;

procedure WordCountTests.CompareDictionaries(Expected, Actual: TDictionary<String, Integer>);
var expectedPair: TPair<string, Integer>;
begin
  Assert.AreEqual(Expected.Count, Actual.Count);
  for expectedPair in Expected do
  begin
    Assert.IsTrue(Actual.ContainsKey(expectedPair.Key));
    Assert.AreEqual(expectedPair.Value, Actual[expectedPair.Key]);
  end;
end;

procedure WordCountTests.Validate_CompareDictionaries;
var expected, actual: TDictionary<String, integer>;
begin
  expected := TDictionary<String, integer>.Create;
  expected.Add('r',5);
  expected.Add('a',10);
  expected.Add('n',15);
  expected.Add('d',20);
  expected.Add('o',25);
  expected.Add('m',30);

  actual := TDictionary<String, Integer>.create(expected);

  CompareDictionaries(expected, actual);
end;

initialization
  TDUnitX.RegisterTestFixture(WordCountTests);
end.