unit uPangramTests;

interface
uses
  DUnitX.TestFramework;

const
  CanonicalVersion = '2.0.0';

type

  [TestFixture('isPangram')]
  TPangramTests = class(TObject)
  public
    [Test]
//    [Ignore('Comment the "[Ignore]" statement to run the test')]
    procedure empty_sentence;

    [Test]
    [Ignore]
    procedure perfect_lower_case;

    [Test]
    [Ignore]
    procedure only_lower_case;

    [Test]
    [Ignore]
    procedure missing_the_letter_x;

    [Test]
    [Ignore]
    procedure missing_the_letter_h;

    [Test]
    [Ignore]
    procedure with_underscores;

    [Test]
    [Ignore]
    procedure with_numbers;

    [Test]
    [Ignore]
    procedure missing_letters_replaced_by_numbers;

    [Test]
    [Ignore]
    procedure mixed_case_and_punctuation;

    [Test]
    [Ignore]
    procedure case_insensitive;
  end;

implementation
uses SysUtils, uPangram;

{ PangramTests }

procedure TPangramTests.empty_sentence;
begin
  Assert.IsFalse(isPangram(''));
end;

procedure TPangramTests.perfect_lower_case;
begin
  Assert.IsTrue(isPangram('abcdefghijklmnopqrstuvwxyz'));
end;

procedure TPangramTests.only_lower_case;
begin
  Assert.IsTrue(isPangram('the quick brown fox jumps over the lazy dog'));
end;

procedure TPangramTests.missing_the_letter_x;
begin
  Assert.IsFalse(isPangram('a quick movement of the enemy will jeopardize five gunboats'));
end;

procedure TPangramTests.missing_the_letter_h;
begin
  Assert.IsFalse(isPangram('five boxing wizards jump quickly at it'));
end;

procedure TPangramTests.with_underscores;
begin
  Assert.IsTrue(isPangram('the_quick_brown_fox_jumps_over_the_lazy_dog'));
end;

procedure TPangramTests.with_numbers;
begin
  Assert.IsTrue(isPangram('the 1 quick brown fox jumps over the 2 lazy dogs'));
end;

procedure TPangramTests.missing_letters_replaced_by_numbers;
begin
  Assert.IsFalse(isPangram('7h3 qu1ck brown fox jumps ov3r 7h3 lazy dog'));
end;

procedure TPangramTests.mixed_case_and_punctuation;
begin
  Assert.IsTrue(isPangram('Five quacking Zephyrs jolt my wax bed.'));
end;

procedure TPangramTests.case_insensitive;
begin
  Assert.IsFalse(isPangram('the quick brown fox jumps over with lazy FX'));
end;

initialization
  TDUnitX.RegisterTestFixture(TPangramTests);
end.
