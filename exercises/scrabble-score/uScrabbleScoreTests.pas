unit uScrabbleScoreTests;

interface
uses
  DUnitX.TestFramework, uScrabbleScore;

const
  CanonicalVersion = '1.1.0.1';

type

  [TestFixture]
  TScrabbleScoreTest = class(TObject)
  public
    [Test]
//    [Ignore('Comment the "[Ignore]" statement to run the test')]
    procedure lowercase_letter;

    [Test]
    [Ignore]
    procedure uppercase_letter;

    [Test]
    [Ignore]
    procedure valuable_letter;

    [Test]
    [Ignore]
    procedure short_word;

    [Test]
    [Ignore]
    procedure short_valuable_word;

    [Test]
    [Ignore]
    procedure medium_word;

    [Test]
    [Ignore]
    procedure medium_valuable_word;

    [Test]
    [Ignore]
    procedure long_mixed_case_word;

    [Test]
    [Ignore]
    procedure english_like_word;

    [Test]
    [Ignore]
    procedure empty_input;

    [Test]
    [Ignore]
    procedure entire_alphabet_available;
  end;

implementation

procedure TScrabbleScoreTest.empty_input;
begin
  Assert.AreEqual(0, TScrabble.Score(''));
end;

procedure TScrabbleScoreTest.english_like_word;
begin
  Assert.AreEqual(8, TScrabble.Score('pinata'));
end;

procedure TScrabbleScoreTest.entire_alphabet_available;
begin
  Assert.AreEqual(87, TScrabble.Score('abcdefghijklmnopqrstuvwxyz'));
end;

procedure TScrabbleScoreTest.long_mixed_case_word;
begin
  Assert.AreEqual(41, TScrabble.Score('OxyphenButazone'));
end;

procedure TScrabbleScoreTest.lowercase_letter;
begin
  Assert.AreEqual(1, TScrabble.Score('a'));
end;

procedure TScrabbleScoreTest.medium_valuable_word;
begin
  Assert.AreEqual(22, TScrabble.Score('quirky'));
end;

procedure TScrabbleScoreTest.medium_word;
begin
  Assert.AreEqual(6, TScrabble.Score('street'));
end;

procedure TScrabbleScoreTest.short_valuable_word;
begin
  Assert.AreEqual(12, TScrabble.Score('zoo'));
end;

procedure TScrabbleScoreTest.short_word;
begin
  Assert.AreEqual(2, TScrabble.Score('at'));
end;

procedure TScrabbleScoreTest.uppercase_letter;
begin
  Assert.AreEqual(1, TScrabble.Score('A'));
end;

procedure TScrabbleScoreTest.valuable_letter;
begin
  Assert.AreEqual(4, TScrabble.Score('f'));
end;

initialization
  TDUnitX.RegisterTestFixture(TScrabbleScoreTest);
end.
