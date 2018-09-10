unit uBobTests;

interface
uses
  DUnitX.TestFramework;

const
  CanonicalVersion = '1.4.0';

type

  [TestFixture]
  BobTests = class(TObject)
  public
    [Test]
//    [Ignore('Comment the "[Ignore]" statement to run the test')]
    procedure Stating_something;

    [Test]
    [Ignore]
    procedure Shouting;

    [Test]
    [Ignore]
    procedure Shouting_gibberish;

    [Test]
    [Ignore]
    procedure Asking_a_question;

    [Test]
    [Ignore]
    procedure Asking_a_numeric_question;

    [Test]
    [Ignore]
    procedure Asking_gibberish;

    [Test]
    [Ignore]
    procedure Talking_forcefully;

    [Test]
    [Ignore]
    procedure Using_acronyms_in_regular_speech;

    [Test]
    [Ignore]
    procedure Forceful_questions;

    [Test]
    [Ignore]
    procedure Shouting_numbers;

    [Test]
    [Ignore]
    procedure No_letters;

    [Test]
    [Ignore]
    procedure Question_with_no_letters;

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
    procedure non_letters_with_question;

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
    procedure Alternate_silence;

    [Test]
    [Ignore]
    procedure Multiple_line_question;

    [Test]
    [Ignore]
    procedure Starting_with_whitespace;

    [Test]
    [Ignore]
    procedure Ending_with_whitespace;

    [Test]
    [Ignore]
    procedure Other_whitespace;

    [Test]
    [Ignore]
    procedure Non_question_ending_with_whitespace;
  end;

implementation
uses uBob;

procedure BobTests.Stating_something;
begin
  Assert.AreEqual('Whatever.', TBob.Response('Tom-ay-to, tom-aaaah-to.'));
end;

procedure BobTests.Shouting;
begin
  Assert.AreEqual('Whoa, chill out!', TBob.Response('WATCH OUT!'));
end;

procedure BobTests.Asking_a_question;
begin
  Assert.AreEqual('Sure.', TBob.Response('Does this cryogenic chamber make me look fat?'));
end;

procedure BobTests.Asking_gibberish;
begin
  Assert.AreEqual('Sure.',TBob.Response('fffbbcbeab?'));
end;

procedure BobTests.Ending_with_whitespace;
begin
  Assert.AreEqual('Sure.', TBob.Response('Okay if like my  spacebar  quite a bit?   '));
end;

procedure BobTests.Alternate_silence;
begin
  Assert.AreEqual('Fine. Be that way!', TBob.Response(#9#9#9#9#9#9#9#9#9#9));
end;

procedure BobTests.Asking_a_numeric_question;
begin
  Assert.AreEqual('Sure.', TBob.Response('You are, what, like 15?'));
end;

procedure BobTests.Talking_forcefully;
begin
  Assert.AreEqual('Whatever.', TBob.Response('Let''s go make out behind the gym!'));
end;

procedure BobTests.Using_acronyms_in_regular_speech;
begin
  Assert.AreEqual('Whatever.', TBob.Response('It''s OK if you don''t want to go to the DMV.'));
end;

procedure BobTests.Forceful_questions;
begin
  Assert.AreEqual('Calm down, I know what I''m doing!', TBob.Response('WHAT THE HELL WERE YOU THINKING?'));
end;

procedure BobTests.Shouting_gibberish;
begin
  Assert.AreEqual('Whoa, chill out!', TBob.Response('FCECDFCAAB'));
end;

procedure BobTests.Shouting_numbers;
begin
  Assert.AreEqual('Whoa, chill out!', TBob.Response('1, 2, 3 GO!'));
end;

procedure BobTests.No_letters;
begin
  Assert.AreEqual('Whatever.', TBob.Response('1, 2, 3'));
end;

procedure BobTests.Other_whitespace;
begin
  Assert.AreEqual('Fine. Be that way!', TBob.Response(#13#10 + ' ' + #9));
end;

procedure BobTests.Question_with_no_letters;
begin
  Assert.AreEqual('Sure.', TBob.Response('4?'));
end;

procedure BobTests.Shouting_with_special_characters;
begin
  Assert.AreEqual('Whoa, chill out!', TBob.Response('ZOMG THE %^*@#$(*^ ZOMBIES ARE COMING!!11!!1!'));
end;

procedure BobTests.Shouting_with_no_exclamation_mark;
begin
  Assert.AreEqual('Whoa, chill out!', TBob.Response('I HATE THE DMV'));
end;

procedure BobTests.Starting_with_whitespace;
begin
  Assert.AreEqual('Whatever.', TBob.Response('         hmmmmmmm...'));
end;

procedure BobTests.Statement_containing_question_mark;
begin
  Assert.AreEqual('Whatever.', TBob.Response('Ending with ? means a question.'));
end;

procedure BobTests.Prattling_on;
begin
  Assert.AreEqual('Sure.', TBob.Response('Wait! Hang on. Are you going to be OK?'));
end;

procedure BobTests.Silence;
begin
  Assert.AreEqual('Fine. Be that way!', TBob.Response(''));
end;

procedure BobTests.Prolonged_silence;
begin
  Assert.AreEqual('Fine. Be that way!', TBob.Response('    '));
end;

procedure BobTests.Multiple_line_question;
begin
  Assert.AreEqual('Whatever.', TBob.Response(#13#10 + 'Does this cryogenic chamber make me look fat?' + #13#10 + 'No.'));
end;

procedure BobTests.non_letters_with_question;
begin
  Assert.AreEqual('Sure.', TBob.Response(':) ?'));
end;

procedure BobTests.Non_question_ending_with_whitespace;
begin
  Assert.AreEqual('Whatever.', TBob.Response('This is a statement ending with whitespace      '));
end;

initialization
  TDUnitX.RegisterTestFixture(BobTests);
end.
