unit uCryptoSquareTests;

interface
uses
  DUnitX.TestFramework;

const
  CanonicalVersion = '3.2.0.1';

type
  [TestFixture]
  TCryptoSquareTest = class(TObject)
  public
    [Test]
//    [Ignore('Comment the "[Ignore]" statement to run the test')]
    procedure empty_plaintext_results_in_an_empty_ciphertext;

    [Test]
    [Ignore]
    procedure Lowercase;

    [Test]
    [Ignore]
    procedure Remove_spaces;

    [Test]
    [Ignore]
    procedure Remove_punctuation;

    [Test]
    [Ignore]
    procedure _9_character_plaintext_results_in_3_chunks_of_3_characters;

    [Test]
    [Ignore]
    procedure _8_character_plaintext_results_in_3_chunks_the_last_one_with_a_trailing_space;

    [Test]
    [Ignore]
    procedure _54_character_plaintext_results_in_7_chunks_the_last_two_with_trailing_spaces;
  end;

implementation

uses
  uCryptoSquare;

procedure TCryptoSquareTest.Lowercase;
begin
  Assert.AreEqual('a', TCryptoSquare.ciphertext('A'));
end;

procedure TCryptoSquareTest.Remove_punctuation;
begin
  Assert.AreEqual('1', TCryptoSquare.ciphertext('@1,%!'));
end;

procedure TCryptoSquareTest.Remove_spaces;
begin
  Assert.AreEqual('b', TCryptoSquare.ciphertext('  b '));
end;

procedure TCryptoSquareTest._54_character_plaintext_results_in_7_chunks_the_last_two_with_trailing_spaces;
begin
  Assert.AreEqual('imtgdvs fearwer mayoogo anouuio ntnnlvt wttddes aohghn  sseoau ',
    TCryptoSquare.ciphertext('If man was meant to stay on the ground, god would have given us roots.'));
end;

procedure TCryptoSquareTest._8_character_plaintext_results_in_3_chunks_the_last_one_with_a_trailing_space;
begin
  Assert.AreEqual('clu hlt io ', TCryptoSquare.ciphertext('Chill out.'));
end;

procedure TCryptoSquareTest._9_character_plaintext_results_in_3_chunks_of_3_characters;
begin
  Assert.AreEqual('tsf hiu isn', TCryptoSquare.ciphertext('This is fun!'));
end;

procedure TCryptoSquareTest.empty_plaintext_results_in_an_empty_ciphertext;
begin
  Assert.AreEqual('', TCryptoSquare.ciphertext(''));
end;

initialization
  TDUnitX.RegisterTestFixture(TCryptoSquareTest);
end.
