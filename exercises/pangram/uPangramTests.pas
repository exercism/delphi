unit uPangramTests;

interface
uses
  DUnitX.TestFramework;

const
  CanonicalVersion = '1.4.0';

type

  [TestFixture]
  PangramTests = class(TObject)
  public
    [Test]
//    [Ignore('Comment the "[Ignore]" statement to run the test')]
    procedure sentence_empty;

    [Test]
    [Ignore]
    procedure recognizes_a_perfect_lower_case_pangram;

    [Test]
    [Ignore]
    procedure pangram_with_only_lower_case;

    [Test]
    [Ignore]
    procedure missing_character_x;

    [Test]
    [Ignore]
    procedure another_missing_character_h;

    [Test]
    [Ignore]
    procedure pangram_with_underscores;

    [Test]
    [Ignore]
    procedure pangram_with_numbers;

    [Test]
    [Ignore]
    procedure missing_letters_replaced_by_numbers;

    [Test]
    [Ignore]
    procedure pangram_with_mixed_case_and_punctuation;

    [Test]
    [Ignore]
    procedure upper_and_lower_case_versions_of_the_same_character_should_not_be_counted_separately;
  end;

implementation
uses SysUtils, uPangram;

{ PangramTests }

procedure PangramTests.sentence_empty;
begin
  Assert.IsFalse(isPangram(''));
end;

procedure PangramTests.recognizes_a_perfect_lower_case_pangram;
begin
  Assert.IsTrue(isPangram('abcdefghijklmnopqrstuvwxyz'));
end;

procedure PangramTests.pangram_with_only_lower_case;
begin
  Assert.IsTrue(isPangram('the quick brown fox jumps over the lazy dog'));
end;

procedure PangramTests.missing_character_x;
begin
  Assert.IsFalse(isPangram('a quick movement of the enemy will jeopardize five gunboats'));
end;

procedure PangramTests.another_missing_character_h;
begin
  Assert.IsFalse(isPangram('five boxing wizards jump quickly at it'));
end;

procedure PangramTests.pangram_with_underscores;
begin
  Assert.IsTrue(isPangram('the_quick_brown_fox_jumps_over_the_lazy_dog'));
end;

procedure PangramTests.pangram_with_numbers;
begin
  Assert.IsTrue(isPangram('the 1 quick brown fox jumps over the 2 lazy dogs'));
end;

procedure PangramTests.missing_letters_replaced_by_numbers;
begin
  Assert.IsFalse(isPangram('7h3 qu1ck brown fox jumps ov3r 7h3 lazy dog'));
end;

procedure PangramTests.pangram_with_mixed_case_and_punctuation;
begin
  Assert.IsTrue(isPangram('Five quacking Zephyrs jolt my wax bed.'));
end;

procedure PangramTests.upper_and_lower_case_versions_of_the_same_character_should_not_be_counted_separately;
begin
  Assert.IsFalse(isPangram('the quick brown fox jumps over with lazy FX'));
end;

initialization
  TDUnitX.RegisterTestFixture(PangramTests);
end.
