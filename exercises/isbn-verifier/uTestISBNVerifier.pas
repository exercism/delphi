unit uTestISBNVerifier;

interface
uses
  DUnitX.TestFramework;

type
  [TestFixture]
  ISBNVerifierTest = class(TObject)
  public
    [Test]
//    [Ignore('Comment the "[Ignore]" statement to run the test')]
    procedure valid_isbn_number;

    [Test]
    [Ignore]
    procedure invalid_isbn_check_digit;

    [Test]
    [Ignore]
    procedure valid_isbn_number_with_a_check_digit_of_10;

    [Test]
    [Ignore]
    procedure check_digit_is_a_character_other_than_X;

    [Test]
    [Ignore]
    procedure invalid_character_in_isbn;

    [Test]
    [Ignore]
    procedure X_is_only_valid_as_a_check_digit;

    [Test]
    [Ignore]
    procedure valid_isbn_without_separating_dashes;

    [Test]
    [Ignore]
    procedure isbn_without_separating_dashes_and_X_as_check_digit;

    [Test]
    [Ignore]
    procedure isbn_without_check_digit_and_dashes;

    [Test]
    [Ignore]
    procedure too_long_isbn_and_no_dashes;

    [Test]
    [Ignore]
    procedure isbn_without_check_digit;

    [Test]
    [Ignore]
    procedure too_long_isbn;

    [Test]
    [Ignore]
    procedure check_digit_of_X_should_not_be_used_for_0;
  end;

implementation
uses uISBNVerifier;

{ ISBNVerifierTest }

procedure ISBNVerifierTest.check_digit_is_a_character_other_than_X;
begin
  Assert.IsFalse(TIsbn.isValid('3-598-21507-A'));
end;

procedure ISBNVerifierTest.check_digit_of_X_should_not_be_used_for_0;
begin
  Assert.IsFalse(TIsbn.isValid('3-598-21515-X'));
end;

procedure ISBNVerifierTest.invalid_character_in_isbn;
begin
  Assert.IsFalse(TIsbn.isValid('3-598-2K507-0'))
end;

procedure ISBNVerifierTest.invalid_isbn_check_digit;
begin
  Assert.IsFalse(TIsbn.isValid('3-598-21508-9'));
end;

procedure ISBNVerifierTest.isbn_without_check_digit;
begin
  Assert.IsFalse(TIsbn.isValid('3-598-21507'));
end;

procedure ISBNVerifierTest.isbn_without_check_digit_and_dashes;
begin
  Assert.IsFalse(TIsbn.isValid('359821507'));
end;

procedure ISBNVerifierTest.isbn_without_separating_dashes_and_X_as_check_digit;
begin
  Assert.IsTrue(TIsbn.isValid('359821507X'));
end;

procedure ISBNVerifierTest.too_long_isbn;
begin
  Assert.IsFalse(TIsbn.isValid('3-598-21507-XX'));
end;

procedure ISBNVerifierTest.too_long_isbn_and_no_dashes;
begin
  Assert.IsFalse(TIsbn.isValid('3598215078X'));
end;

procedure ISBNVerifierTest.valid_isbn_number;
begin
  Assert.IsTrue(TIsbn.isValid('3-598-21508-8'));
end;

procedure ISBNVerifierTest.valid_isbn_number_with_a_check_digit_of_10;
begin
  Assert.IsTrue(TIsbn.isValid('3-598-21507-X'));
end;

procedure ISBNVerifierTest.valid_isbn_without_separating_dashes;
begin
  Assert.IsTrue(TIsbn.isValid('3598215088'));
end;

procedure ISBNVerifierTest.X_is_only_valid_as_a_check_digit;
begin
  Assert.IsFalse(TIsbn.isValid('3-598-2X507-9'));
end;

initialization
  TDUnitX.RegisterTestFixture(ISBNVerifierTest);
end.
