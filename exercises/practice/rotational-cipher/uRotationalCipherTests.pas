unit uRotationalCipherTests;

interface
uses
  DUnitX.TestFramework;

const
  CanonicalVersion = '1.2.0.1';

type

  [TestFixture('Test rotation from English to ROTn')]
  RotationalCipherTests = class(TObject)
  public
    [Test]
//    [Ignore('Comment the "[Ignore]" statement to run the test')]
    procedure rotate_a_by_0_same_output_as_input;

    [Test]
    [Ignore]
    procedure rotate_a_by_1;

    [Test]
    [Ignore]
    procedure rotate_a_by_26_same_output_as_input;

    [Test]
    [Ignore]
    procedure rotate_m_by_13;

    [Test]
    [Ignore]
    procedure rotate_n_by_13_with_wrap_around_alphabet;

    [Test]
    [Ignore]
    procedure rotate_capital_letters;

    [Test]
    [Ignore]
    procedure rotate_spaces;

    [Test]
    [Ignore]
    procedure rotate_numbers;

    [Test]
    [Ignore]
    procedure rotate_punctuation;

    [Test]
    [Ignore]
    procedure rotate_all_letters;

    [Test]
    [Ignore('Optional: Challenge Test')]
    procedure rotate_m_by_negative_1;

    [Test]
    [Ignore('Optional: Challenge Test')]
    procedure rotate_A_by_negative_2;

    [Test]
    [Ignore('Optional: Challenge Test')]
    procedure rotate_letters_by_negative_26;
  end;

implementation
uses sysutils, uRotationalCipher;

procedure RotationalCipherTests.rotate_a_by_0_same_output_as_input;
begin
  Assert.AreEqual('a', RotationalCipher.rotate('a', 0));
end;

procedure RotationalCipherTests.rotate_a_by_1;
begin
  Assert.AreEqual('b', RotationalCipher.rotate('a', 1));
end;

procedure RotationalCipherTests.rotate_a_by_26_same_output_as_input;
begin
  Assert.AreEqual('a', RotationalCipher.rotate('a', 26));
end;

procedure RotationalCipherTests.rotate_m_by_13;
begin
  Assert.AreEqual('z', RotationalCipher.rotate('m', 13));
end;

procedure RotationalCipherTests.rotate_n_by_13_with_wrap_around_alphabet;
begin
  Assert.AreEqual('a', RotationalCipher.rotate('n', 13));
end;

procedure RotationalCipherTests.rotate_capital_letters;
begin
  Assert.AreEqual('TRL', RotationalCipher.rotate('OMG', 5));
end;

procedure RotationalCipherTests.rotate_spaces;
begin
  Assert.AreEqual('T R L', RotationalCipher.rotate('O M G', 5));
end;

procedure RotationalCipherTests.rotate_numbers;
begin
  Assert.AreEqual('Xiwxmrk 1 2 3 xiwxmrk',
    RotationalCipher.rotate('Testing 1 2 3 testing', 4));
end;

procedure RotationalCipherTests.rotate_punctuation;
begin
  Assert.AreEqual('Gzo''n zvo, Bmviyhv!',
    RotationalCipher.rotate('Let''s eat, Grandma!', 21));
end;

procedure RotationalCipherTests.rotate_all_letters;
begin
  Assert.AreEqual('Gur dhvpx oebja sbk whzcf bire gur ynml qbt.',
    RotationalCipher.rotate('The quick brown fox jumps over the lazy dog.', 13));
end;

{$region 'Bonus Tests'}
procedure RotationalCipherTests.rotate_m_by_negative_1;
begin
  Assert.AreEqual('l',
    RotationalCipher.rotate('m', -1));
end;

procedure RotationalCipherTests.rotate_A_by_negative_2;
begin
  Assert.AreEqual('Y',
    RotationalCipher.rotate('A', -2));
end;

procedure RotationalCipherTests.rotate_letters_by_negative_26;
begin
  Assert.AreEqual('OMG',
    RotationalCipher.rotate('OMG', -26));
end;
{$endregion 'Bonus Tests'}

initialization
  TDUnitX.RegisterTestFixture(RotationalCipherTests);
end.
