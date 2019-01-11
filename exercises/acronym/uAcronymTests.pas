unit uAcronymTests;

interface
uses
  DUnitX.TestFramework;

const
  CanonicalVersion = '1.7.0';

type

  [TestFixture('Abbreviate a phrase')]
  AcronymTests = class(TObject)
  public
    [Test]
//    [Ignore('Comment the "[Ignore]" statement to run the test')]
    procedure basic;

    [Test]
    [Ignore]
    procedure lowercase_words;

    [Test]
    [Ignore]
    procedure punctuation;

    [Test]
    [Ignore]
    procedure all_caps_word;

    [Test]
    [Ignore]
    procedure punctuation_without_whitespace;

    [Test]
    [Ignore]
    procedure very_long_abbreviation;

    [Test]
    [Ignore]
    procedure consecutive_delimiters;

    [Test]
    [Ignore]
    procedure apostrophes;

    [Test]
    [Ignore]
    procedure underscore_emphasis;
  end;

implementation
uses SysUtils, uAcronym;

{ AcronymTests }

procedure AcronymTests.all_caps_word;
begin
  Assert.AreEqual('GIMP', abbreviate('GNU Image Manipulation Program'));
end;

procedure AcronymTests.apostrophes;
begin
  Assert.AreEqual('HC', abbreviate('Halley''s Comet'));
end;

procedure AcronymTests.basic;
begin
  Assert.AreEqual('PNG', abbreviate('Portable Network Graphics'));
end;

procedure AcronymTests.consecutive_delimiters;
begin
  Assert.AreEqual('SIMUFTA', abbreviate('Something - I made up from thin air'));
end;

procedure AcronymTests.lowercase_words;
begin
  Assert.AreEqual('ROR', abbreviate('Ruby on Rails'));
end;

procedure AcronymTests.punctuation;
begin
  Assert.AreEqual('FIFO', abbreviate('First In, First Out'));
end;

procedure AcronymTests.punctuation_without_whitespace;
begin
  Assert.AreEqual('CMOS', abbreviate('Complementary metal-oxide semiconductor'));
end;

procedure AcronymTests.very_long_abbreviation;
begin
  Assert.AreEqual('ROTFLSHTMDCOALM', abbreviate('Rolling On The Floor ' +
    'Laughing So Hard That My Dogs Came Over And Licked Me'));
end;

procedure AcronymTests.underscore_emphasis;
begin
  Assert.AreEqual('TRNT', abbreviate('The Road _Not_ Taken'));
end;

initialization
  TDUnitX.RegisterTestFixture(AcronymTests);
end.
