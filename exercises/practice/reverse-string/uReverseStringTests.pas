unit uReverseStringTests;

interface
uses
  DUnitX.TestFramework;

const
   CanonicalVersion = '1.2.0';

type

  [TestFixture]
  ReverseStringTest = class(TObject)
  public
    [Test]
//    [Ignore('Comment the "[Ignore]" statement to run the test')]
    procedure an_empty_string;

    [Test]
    [Ignore]
    procedure a_word;

    [Test]
    [Ignore]
    procedure a_capitalized_word;

    [Test]
    [Ignore]
    procedure a_sentence_with_punctuation;

    [Test]
    [Ignore]
    procedure a_palindrome;

    [Test]
    [Ignore]
    procedure an_even_sized_word;
  end;

implementation
uses uReverseString;


{ ReverseStringTest }

procedure ReverseStringTest.an_empty_string;
begin
  Assert.AreEqual('', reverse(''));
end;

procedure ReverseStringTest.an_even_sized_word;
begin
  Assert.AreEqual('reward',reverse('drawer'));
end;

procedure ReverseStringTest.a_capitalized_word;
begin
  Assert.AreEqual('nemaR',reverse('Ramen'));
end;

procedure ReverseStringTest.a_palindrome;
begin
  Assert.AreEqual('racecar',reverse('racecar'));
end;

procedure ReverseStringTest.a_sentence_with_punctuation;
begin
  Assert.AreEqual('!yrgnuh m''I', reverse('I''m hungry!'));
end;

procedure ReverseStringTest.a_word;
begin
  Assert.AreEqual('tobor', reverse('robot'));
end;

initialization
  TDUnitX.RegisterTestFixture(ReverseStringTest);
end.
