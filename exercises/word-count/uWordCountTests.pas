unit uWordCountTests;

interface
uses
  System.Generics.Collections, DUnitX.TestFramework;
  
const
  CanonicalVersion = '1.2.0';  

type

  [TestFixture]
  WordCountTests = class(TObject)
  private
    procedure CompareDictionaries(Expected, Actual: TDictionary<String, integer>);
  public
    [Test]
    procedure Validate_CompareDictionaries;
	
    [Test]
    // [Ignore('Comment the "[Ignore]" statement to run the test')]
    procedure Count_one_word;

    [Test]
    [Ignore]
    procedure Count_one_of_each_word;

    [Test]
    [Ignore]
    procedure Multiple_occurrences_of_a_word;

    [Test]
    [Ignore]
    procedure Handles_cramped_lists;

    [Test]
    [Ignore]
    procedure Handles_expanded_lists;

    [Test]
    [Ignore]
    procedure Ignore_punctuation;

    [Test]
    [Ignore]
    procedure Include_numbers;

    [Test]
    [Ignore]
    procedure Normalize_case;

    [Test]
    [Ignore]
    procedure With_apostrophes;

    [Test]
    [Ignore]
    procedure With_quotations;

    [Test]
    [Ignore]
    procedure Multiple_spaces_not_detected_as_a_word;

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

procedure WordCountTests.Count_one_word;
var expected, actual: TDictionary<String, integer>;
begin
  expected := TDictionary<String, integer>.Create;
  expected.Add('word',1);

  actual := WordCount('word').countWords;
  
  CompareDictionaries(expected, actual);
end;

procedure WordCountTests.Count_one_of_each_word;
var expected, actual: TDictionary<String, integer>;
begin
  expected := TDictionary<String, integer>.Create;
  expected.Add('one',1);
  expected.Add('of',1);
  expected.Add('each',1);

  actual :=  WordCount('one of each').countWords;
  
  CompareDictionaries(expected, actual);
end;

procedure WordCountTests.Multiple_occurrences_of_a_word;
var expected, actual: TDictionary<String, integer>;
begin
  expected := TDictionary<String, integer>.Create;
  expected.Add('one',1);
  expected.Add('fish',4);
  expected.Add('two',1);  
  expected.Add('red',1);
  expected.Add('blue',1);
  
  actual := WordCount('one fish two fish red fish blue fish').countWords;

  CompareDictionaries(expected, actual);
end;

procedure WordCountTests.Handles_cramped_lists;
var expected, actual: TDictionary<String, integer>;
begin
  expected := TDictionary<String, integer>.Create;
  expected.Add('one',1);
  expected.Add('two',1);
  expected.Add('three',1);  

  actual := WordCount('one,two,three').countWords;

  CompareDictionaries(expected, actual);  
end;

procedure WordCountTests.Handles_expanded_lists;
var expected, actual: TDictionary<String, integer>;
begin
  expected := TDictionary<String, integer>.Create;
  expected.Add('one',1);
  expected.Add('two',1);
  expected.Add('three',1);  

  actual := WordCount('one,\ntwo,\nthree').countWords;

  CompareDictionaries(expected, actual);  
end;

procedure WordCountTests.Ignore_punctuation;
var expected, actual: TDictionary<String, integer>;
begin
  expected := TDictionary<String, integer>.Create;
  expected.Add('car',1);
  expected.Add('carpet',1);
  expected.Add('as',1);  
  expected.Add('java',1);
  expected.Add('javascript',1);

  actual := WordCount('car: carpet as java: javascript!!&@$%^&').countWords;

  CompareDictionaries(expected, actual);  
end;

procedure WordCountTests.Include_numbers;
var expected, actual: TDictionary<String, integer>;
begin
  expected := TDictionary<String, integer>.Create;
  expected.Add('testing',2);
  expected.Add('1',1);
  expected.Add('2',1);  

  actual := WordCount('testing, 1, 2 testing').countWords;

  CompareDictionaries(expected, actual);
end;

procedure WordCountTests.Normalize_case;
var expected, actual: TDictionary<String, integer>;
begin
  expected := TDictionary<String, integer>.Create;
  expected.Add('go',3);
  expected.Add('stop',2);

  actual := WordCount('go Go GO Stop stop').countWords;

  CompareDictionaries(expected, actual);  
end;

procedure WordCountTests.With_apostrophes;
var expected, actual: TDictionary<String, integer>;
begin
  expected := TDictionary<String, integer>.Create;
  expected.Add('first',1);
  expected.Add('don''t',2);
  expected.Add('laugh',1);  
  expected.Add('then',1);
  expected.Add('cry',1);

  actual := WordCount('First: don''t laugh. Then: don''t cry.').countWords;

  CompareDictionaries(expected, actual);    
end;

procedure WordCountTests.With_quotations;
var expected, actual: TDictionary<String, integer>;
begin
  expected := TDictionary<String, integer>.Create;
  expected.Add('joe',1);
  expected.Add('can''t',1);
  expected.Add('tell',1);  
  expected.Add('between',1);
  expected.Add('large',2);
  expected.Add('and',1);  

  actual := WordCount('Joe can''t tell between ''large'' and large').countWords;

  CompareDictionaries(expected, actual);    
end;

procedure WordCountTests.Multiple_spaces_not_detected_as_a_word;
var expected, actual: TDictionary<String, integer>;
begin
  expected := TDictionary<String, integer>.Create;
  expected.Add('multiple',1);
  expected.Add('whitespaces',1);

  actual := WordCount(' multiple   whitespaces').countWords;

  CompareDictionaries(expected, actual);    
end;

initialization
  TDUnitX.RegisterTestFixture(WordCountTests);
end.
