unit uETLTests;

interface
uses
  System.Generics.Collections, DUnitX.TestFramework;

const
  CanonicalVersion = '1.0.0.1';

type

  [TestFixture]
  testETL = class(TObject)
  private
    procedure CompareDictionaries(Expected, Actual: TDictionary<String, integer>);
  public
    [Test]
    procedure Validate_CompareDictionaries;

    [Test]
//    [Ignore('Comment the "[Ignore]" statement to run the test')]
    procedure A_single_letter;

    [Test]
    [Ignore]
    procedure Single_score_with_multiple_letters;

    [Test]
    [Ignore]
    procedure Multiple_scores_with_multiple_letters;

    [Test]
    [Ignore]
    procedure Multiple_scores_with_differing_numbers_of_letters;
  end;

implementation
uses SysUtils, uETL;

procedure testETL.CompareDictionaries(Expected, Actual: TDictionary<String, Integer>);
var expectedPair: TPair<string, Integer>;
begin
  Assert.AreEqual(Expected.Count, Actual.Count);
  for expectedPair in Expected do
  begin
    Assert.IsTrue(Actual.ContainsKey(expectedPair.Key));
    Assert.AreEqual(expectedPair.Value, Actual[expectedPair.Key]);
  end;
end;

procedure testETL.Validate_CompareDictionaries;
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

procedure testETL.A_single_letter;
var aList: TList<string>;
    old: TDictionary<integer, TList<string>>;
    expected: TDictionary<string, integer>;
begin
  aList := TList<string>.Create;
  aList.Add('A');
  old := TDictionary<integer, TList<string>>.Create;
  old.Add(1, aList);

  expected := TDictionary<string, integer>.Create;
  expected.Add('a', 1);

  CompareDictionaries(expected, ETL.Transform(old));
end;

procedure testETL.Single_score_with_multiple_letters;
var aList: TList<string>;
    old: TDictionary<integer, TList<string>>;
    expected: TDictionary<string, integer>;
begin
  aList := TList<string>.create;
  aList.AddRange(['A','E','I','O','U']);
  old := TDictionary<integer, TList<string>>.Create;
  old.Add(1, aList);

  expected := TDictionary<string, integer>.Create;
  expected.Add('a',1);
  expected.Add('e',1);
  expected.Add('i',1);
  expected.Add('o',1);
  expected.Add('u',1);

  CompareDictionaries(expected, ETL.Transform(old));
end;

procedure testETL.Multiple_scores_with_multiple_letters;
var aList: TList<string>;
    old: TDictionary<integer, TList<string>>;
    expected: TDictionary<string, integer>;
begin
  aList := TList<string>.Create;
  aList.Add('A');
  aList.Add('E');
  old := TDictionary<integer, TList<string>>.Create;
  old.Add(1, aList);
  aList := TList<string>.Create;
  aList.Add('D');
  aList.Add('G');
  old.Add(2, aList);

  expected := TDictionary<string, integer>.Create;
  expected.Add('a',1);
  expected.Add('d',2);
  expected.Add('e',1);
  expected.Add('g',2);

  CompareDictionaries(expected, ETL.Transform(old));
end;

procedure testETL.Multiple_scores_with_differing_numbers_of_letters;
var aList: TList<string>;
    old: TDictionary<integer, TList<string>>;
    expected: TDictionary<string, integer>;
begin
  aList := TList<string>.Create;
  aList.AddRange(['A','E','I','O','U','L','N','R','S','T']);
  old := TDictionary<integer, TList<string>>.Create;
  old.Add(1, aList);

  aList := TList<string>.Create;
  aList.AddRange(['D','G']);
  old.Add(2, aList);

  aList := TList<string>.Create;
  aList.AddRange(['B','C','M','P']);
  old.Add(3, aList);

  aList := TList<string>.Create;
  aList.AddRange(['F','H','V','W','Y']);
  old.Add(4, aList);

  aList := TList<string>.Create;
  aList.Add('K');
  old.Add(5, aList);

  aList := TList<string>.Create;
  aList.AddRange(['J','X']);
  old.Add(8, aList);

  aList := TList<string>.Create;
  aList.AddRange(['Q','Z']);
  old.Add(10, aList);

  expected := TDictionary<string, integer>.Create;
  expected.Add('a',1);
  expected.Add('b',3);
  expected.Add('c',3);
  expected.Add('d',2);
  expected.Add('e',1);
  expected.Add('f',4);
  expected.Add('g',2);
  expected.Add('h',4);
  expected.Add('i',1);
  expected.Add('j',8);
  expected.Add('k',5);
  expected.Add('l',1);
  expected.Add('m',3);
  expected.Add('n',1);
  expected.Add('o',1);
  expected.Add('p',3);
  expected.Add('q',10);
  expected.Add('r',1);
  expected.Add('s',1);
  expected.Add('t',1);
  expected.Add('u',1);
  expected.Add('v',4);
  expected.Add('w',4);
  expected.Add('x',8);
  expected.Add('y',4);
  expected.Add('z',10);

  CompareDictionaries(expected, ETL.Transform(old));
end;

initialization
  TDUnitX.RegisterTestFixture(testETL);
end.
