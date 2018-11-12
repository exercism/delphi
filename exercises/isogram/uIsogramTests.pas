unit uIsogramTests;

interface
uses
  DUnitX.TestFramework;

const
  CanonicalVersion = '1.7.0';

type

  [TestFixture]
  IsogramTests = class(TObject)
  public
    [Test]
//    [Ignore('Comment the "[Ignore]" statement to run the test')]
    procedure empty_string;

    [Test]
    [Ignore]
    procedure isogram_with_only_lower_case_characters;

    [Test]
    [Ignore]
    procedure word_with_one_duplicated_character;

    [Test]
    [Ignore]
    procedure word_with_one_duplicated_character_from_the_end_of_the_alphabet;

    [Test]
    [Ignore]
    procedure longest_reported_english_isogram;

    [Test]
    [Ignore]
    procedure word_with_duplicated_character_in_mixed_case;

    [Test]
    [Ignore]
    procedure word_with_duplicated_character_in_mixed_case_lowercase_first;

    [Test]
    [Ignore]
    procedure hypothetical_isogrammic_word_with_hyphen;

    [Test]
    [Ignore]
    procedure hypothetical_word_with_duplicated_character_following_hyphen;

    [Test]
    [Ignore]
    procedure isogram_with_duplicated_hyphen;

    [Test]
    [Ignore]
    procedure made_up_name_that_is_an_isogram;

    [Test]
    [Ignore]
    procedure duplicated_character_in_the_middle;

    [Test]
    [Ignore]
    procedure same_first_and_last_characters;
  end;
	
implementation
uses SysUtils, uIsogram;

{ IsogramTests }

procedure IsogramTests.duplicated_character_in_the_middle;
begin
  Assert.IsFalse(isIsogram('accentor'));
end;

procedure IsogramTests.empty_string;
begin
  Assert.IsTrue(isIsogram(''));
end;

procedure IsogramTests.hypothetical_isogrammic_word_with_hyphen;
begin
  Assert.IsTrue(isIsogram('thumbscrew-japingly'));
end;

procedure IsogramTests.hypothetical_word_with_duplicated_character_following_hyphen;
begin
  Assert.IsFalse(isIsogram('thumbscrew-jappingly'));
end;

procedure IsogramTests.isogram_with_duplicated_hyphen;
begin
  Assert.IsTrue(isIsogram('six-year-old'));
end;

procedure IsogramTests.isogram_with_only_lower_case_characters;
begin
  Assert.IsTrue(isIsogram('isogram'));
end;

procedure IsogramTests.longest_reported_english_isogram;
begin
  Assert.IsTrue(isIsogram('subdermatoglyphic'));
end;

procedure IsogramTests.made_up_name_that_is_an_isogram;
begin
  Assert.IsTrue(isIsogram('Emily Jung Schwartzkopf'));
end;

procedure IsogramTests.same_first_and_last_characters;
begin
  Assert.IsFalse(isIsogram('angola'));
end;

procedure IsogramTests.word_with_duplicated_character_in_mixed_case;
begin
  Assert.IsFalse(isIsogram('Alphabet'));
end;

procedure IsogramTests.word_with_duplicated_character_in_mixed_case_lowercase_first;
begin
  Assert.IsFalse(isIsogram('alphAbet'));
end;

procedure IsogramTests.word_with_one_duplicated_character;
begin
  Assert.IsFalse(isIsogram('eleven'));
end;

procedure IsogramTests.word_with_one_duplicated_character_from_the_end_of_the_alphabet;
begin
  Assert.IsFalse(isIsogram('zzyzx'));
end;

initialization
  TDUnitX.RegisterTestFixture(IsogramTests);
end.
