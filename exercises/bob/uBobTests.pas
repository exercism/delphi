unit uBobTests;

interface
uses
  DUnitX.TestFramework;

type

  [TestFixture]
  BobTests = class(TObject)
  public
    [Test]
    procedure Stating_something;

    [Test]
    [Ignore('Comment these lines to run these tests')]
    procedure Shouting;

    [Test]
    [Ignore]
    procedure Asking_a_question;

    [Test]
    [Ignore]
    procedure Asking_a_question_with_a_trailing_space;

    [Test]
    [Ignore]
    procedure Asking_a_numeric_question;

    [Test]
    [Ignore]
    procedure Talking_forcefully;

    [Test]
    [Ignore]
    procedure Using_acronyms_in_regular_search;

    [Test]
    [Ignore]
    procedure Forceful_questions;

    [Test]
    [Ignore]
    procedure Shouting_numbers;

    [Test]
    [Ignore]
    procedure Only_numbers;

    [Test]
    [Ignore]
    procedure Question_with_only_numbers;

    [Test]
    [Ignore]
    procedure Shouting_with_special_characters;

    [Test]
    [Ignore]
    procedure Shouting_with_no_exclamation_mark;

    [Test]
    [Ignore]
    procedure Statement_containing_question_mark;

    [Test]
    [Ignore]
    procedure Prattling_on;

    [Test]
    [Ignore]
    procedure Silence;

    [Test]
    [Ignore]
    procedure Prolonged_silence;

    [Test]
    [Ignore]
    procedure Multiple_line_question;
  end;

implementation
uses uBob;

procedure BobTests.Stating_something;
begin
  assert.AreEqual('Whatever.', TBob.Hey('Tom-ay-to, tom-aaaah-to.'));
end;

procedure BobTests.Shouting;
begin
  assert.AreEqual('Whoa, chill out!', TBob.Hey('WATCH OUT!'));
end;

procedure BobTests.Asking_a_question;
begin
  assert.AreEqual('Sure.', TBob.Hey('Does this cryogenic chamber make me look fat?'));
end;

procedure BobTests.Asking_a_question_with_a_trailing_space;
begin
  assert.AreEqual('Sure.', TBob.Hey('Do I like my  spacebar  too much?  '));
end;

procedure BobTests.Asking_a_numeric_question;
begin
  assert.AreEqual('Sure.', TBob.Hey('You are, what, like 15?'));
end;

procedure BobTests.Talking_forcefully;
begin
  assert.AreEqual('Whatever.', TBob.Hey('Let''s go make out behind the gym!'));
end;

procedure BobTests.Using_acronyms_in_regular_search;
begin
  assert.AreEqual('Whatever.', TBob.Hey('It''s OK if you don''t want to go to the DMV.'));
end;

procedure BobTests.Forceful_questions;
begin
  assert.AreEqual('Whoa, chill out!', TBob.Hey('WHAT THE HELL WERE YOU THINKING?'));
end;

procedure BobTests.Shouting_numbers;
begin
  assert.AreEqual('Whoa, chill out!', TBob.Hey('1, 2, 3 GO!'));
end;

procedure BobTests.Only_numbers;
begin
  assert.AreEqual('Whatever.', TBob.Hey('1, 2, 3'));
end;

procedure BobTests.Question_with_only_numbers;
begin
  assert.AreEqual('Sure.', TBob.Hey('4?'));
end;

procedure BobTests.Shouting_with_special_characters;
begin
  assert.AreEqual('Whoa, chill out!', TBob.Hey('ZOMG THE %^*@#$(*^ ZOMBIES ARE COMING!!11!!1!'));
end;

procedure BobTests.Shouting_with_no_exclamation_mark;
begin
  assert.AreEqual('Whoa, chill out!', TBob.Hey('I HATE YOU'));
end;

procedure BobTests.Statement_containing_question_mark;
begin
  assert.AreEqual('Whatever.', TBob.Hey('Ending with ? means a question.'));
end;

procedure BobTests.Prattling_on;
begin
  assert.AreEqual('Sure.', TBob.Hey('Wait! Hang on. Are you going to be OK?'));
end;

procedure BobTests.Silence;
begin
  assert.AreEqual('Fine.  Be that way!', TBob.Hey(''));
end;

procedure BobTests.Prolonged_silence;
begin
  assert.AreEqual('Fine.  Be that way!', TBob.Hey('    '));
end;

procedure BobTests.Multiple_line_question;
begin
  assert.AreEqual('Whatever.', TBob.Hey('Does this cryogenic chamber make me look fat?' + #13#10 + 'no'));
end;

initialization
  TDUnitX.RegisterTestFixture(BobTests);
end.
