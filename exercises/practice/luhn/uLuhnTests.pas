unit uLuhnTests;

interface
uses
  DUnitX.TestFramework;

const
  CanonicalVersion = '1.6.1.1';

type

  [TestFixture]
  TLuhnTest = class(TObject)
  public
    [Test]
//    [Ignore('Comment the "[Ignore]" statement to run the test')]
    procedure single_digit_strings_can_not_be_valid;

    [Test]
    [Ignore]
    procedure a_single_zero_is_invalid;

    [Test]
    [Ignore]
    procedure a_simple_valid_SIN_that_remains_valid_if_reversed;

    [Test]
    [Ignore]
    procedure a_simple_valid_SIN_that_becomes_invalid_if_reversed;

    [Test]
    [Ignore]
    procedure a_valid_Canadian_SIN;

    [Test]
    [Ignore]
    procedure invalid_Canadian_SIN;

    [Test]
    [Ignore]
    procedure invalid_credit_card;

    [Test]
    [Ignore]
    procedure valid_number_with_an_even_number_of_digits;

    [Test]
    [Ignore]
    procedure valid_number_with_an_odd_number_of_spaces;

    [Test]
    [Ignore]
    procedure valid_strings_with_a_non_digit_added_at_the_end_become_invalid;

    [Test]
    [Ignore]
    procedure valid_strings_with_punctuation_included_become_invalid;

    [Test]
    [Ignore]
    procedure valid_strings_with_symbols_included_become_invalid;

    [Test]
    [Ignore]
    procedure single_zero_with_space_is_invalid;

    [Test]
    [Ignore]
    procedure more_than_a_single_zero_is_valid;

    [Test]
    [Ignore]
    procedure input_digit_9_is_correctly_converted_to_output_digit_9;

    [Test]
    [Ignore]
    procedure using_ascii_value_for_non_doubled_non_digit_is_not_allowed;

    [Test]
    [Ignore]
    procedure using_ascii_value_for_doubled_non_digit_is_not_allowed;
  end;

implementation

uses
  uLuhn;

procedure TLuhnTest.a_simple_valid_SIN_that_becomes_invalid_if_reversed;
begin
  Assert.AreEqual(true, TLuhn.Valid('59'));
end;

procedure TLuhnTest.a_simple_valid_SIN_that_remains_valid_if_reversed;
begin
  Assert.AreEqual(true, TLuhn.Valid('059'));
end;

procedure TLuhnTest.a_single_zero_is_invalid;
begin
  Assert.AreEqual(false, TLuhn.Valid('0'));
end;

procedure TLuhnTest.a_valid_Canadian_SIN;
begin
  Assert.AreEqual(true, TLuhn.Valid('055 444 285'));
end;

procedure TLuhnTest.input_digit_9_is_correctly_converted_to_output_digit_9;
begin
  Assert.AreEqual(true, TLuhn.Valid('091'));
end;

procedure TLuhnTest.invalid_Canadian_SIN;
begin
  Assert.AreEqual(false, TLuhn.Valid('055 444 286'));
end;

procedure TLuhnTest.invalid_credit_card;
begin
  Assert.AreEqual(false, TLuhn.Valid('8273 1232 7352 0569'));
end;

procedure TLuhnTest.more_than_a_single_zero_is_valid;
begin
  Assert.AreEqual(true, TLuhn.Valid('0000 0'));
end;

procedure TLuhnTest.single_digit_strings_can_not_be_valid;
begin
  Assert.AreEqual(false, TLuhn.Valid('1'));
end;

procedure TLuhnTest.single_zero_with_space_is_invalid;
begin
  Assert.AreEqual(false, TLuhn.Valid(' 0'));
end;

procedure TLuhnTest.using_ascii_value_for_doubled_non_digit_is_not_allowed;
begin
  Assert.AreEqual(false, TLuhn.Valid(':9'));
end;

procedure TLuhnTest.valid_number_with_an_even_number_of_digits;
begin
  Assert.AreEqual(true, TLuhn.Valid('095 245 88'));
end;

procedure TLuhnTest.valid_number_with_an_odd_number_of_spaces;
begin
  Assert.AreEqual(true, TLuhn.Valid('234 567 891 234'));
end;

procedure TLuhnTest.valid_strings_with_a_non_digit_added_at_the_end_become_invalid;
begin
  Assert.AreEqual(false, TLuhn.Valid('059a'));
end;

procedure TLuhnTest.using_ascii_value_for_non_doubled_non_digit_is_not_allowed;
begin
  Assert.AreEqual(false, TLuhn.Valid('055a 444 285'));
end;

procedure TLuhnTest.valid_strings_with_punctuation_included_become_invalid;
begin
  Assert.AreEqual(false, TLuhn.Valid('055-444-285'));
end;

procedure TLuhnTest.valid_strings_with_symbols_included_become_invalid;
begin
  Assert.AreEqual(false, TLuhn.Valid('055# 444$ 285'));
end;

initialization
  TDUnitX.RegisterTestFixture(TLuhnTest);
end.
