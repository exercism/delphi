unit uSecretHandshakeTests;

interface
uses
  DUnitX.TestFramework;

const
  CanonicalVersion = '1.2.0.1';

type
  [TestFixture]
  SecretHandshakeTest = class(TObject)
  private
    procedure CompareArrays(aExpected, aActual: TArray<string>);
  public
    [Test]
//    [Ignore('Comment the "[Ignore]" statement to run the test')]
    procedure wink_for_1;

    [Test]
    [Ignore]
    procedure double_blink_for_10;

    [Test]
    [Ignore]
    procedure close_your_eyes_for_100;

    [Test]
    [Ignore]
    procedure jump_for_1000;

    [Test]
    [Ignore]
    procedure combine_two_actions;

    [Test]
    [Ignore]
    procedure reverse_two_actions;

    [Test]
    [Ignore]
    procedure reversing_one_action_gives_the_same_action;

    [Test]
    [Ignore]
    procedure reversing_no_actions_still_gives_no_actions;

    [Test]
    [Ignore]
    procedure all_possible_actions;

    [Test]
    [Ignore]
    procedure reverse_all_possible_actions;

    [Test]
    [Ignore]
    procedure do_nothing_for_zero;
  end;

implementation
uses uSecretHandshake;


{ SecretHandshakeTest }

procedure SecretHandshakeTest.all_possible_actions;
var Expected,
    Actual: TArray<string>;
begin
  SetLength(Expected, 4);
  Expected[0] := 'wink';
  Expected[1] := 'double blink';
  Expected[2] := 'close your eyes';
  Expected[3] := 'jump';

  Actual := TSecretHandshake.commands(15);

  CompareArrays(Expected, Actual);
end;

procedure SecretHandshakeTest.close_your_eyes_for_100;
var Expected,
    Actual: TArray<string>;
begin
  SetLength(Expected, 1);
  Expected[0] := 'close your eyes';

  Actual := TSecretHandshake.commands(4);

  CompareArrays(Expected, Actual);
end;

procedure SecretHandshakeTest.combine_two_actions;
var Expected,
    Actual: TArray<string>;
begin
  SetLength(Expected, 2);
  Expected[0] := 'wink';
  Expected[1] := 'double blink';

  Actual := TSecretHandshake.commands(3);

  CompareArrays(Expected, Actual);
end;

procedure SecretHandshakeTest.double_blink_for_10;
var Expected,
    Actual: TArray<string>;
begin
  SetLength(Expected, 1);
  Expected[0] := 'double blink';

  Actual := TSecretHandshake.commands(2);

  CompareArrays(Expected, Actual);
end;

procedure SecretHandshakeTest.do_nothing_for_zero;
var Expected,
    Actual: TArray<string>;
begin
  SetLength(Expected, 0);

  Actual := TSecretHandshake.commands(0);

  CompareArrays(Expected, Actual);
end;

procedure SecretHandshakeTest.jump_for_1000;
var Expected,
    Actual: TArray<string>;
begin
  SetLength(Expected, 1);
  Expected[0] := 'jump';

  Actual := TSecretHandshake.commands(8);

  CompareArrays(Expected, Actual);
end;

procedure SecretHandshakeTest.reverse_all_possible_actions;
var Expected,
    Actual: TArray<string>;
begin
  SetLength(Expected, 4);
  Expected[0] := 'jump';
  Expected[1] := 'close your eyes';
  Expected[2] := 'double blink';
  Expected[3] := 'wink';

  Actual := TSecretHandshake.commands(31);

  CompareArrays(Expected, Actual);
end;

procedure SecretHandshakeTest.reverse_two_actions;
var Expected,
    Actual: TArray<string>;
begin
  SetLength(Expected, 2);
  Expected[0] := 'double blink';
  Expected[1] := 'wink';

  Actual := TSecretHandshake.commands(19);

  CompareArrays(Expected, Actual);
end;

procedure SecretHandshakeTest.reversing_no_actions_still_gives_no_actions;
var Expected,
    Actual: TArray<string>;
begin
  SetLength(Expected, 0);

  Actual := TSecretHandshake.commands(16);

  CompareArrays(Expected, Actual);
end;

procedure SecretHandshakeTest.reversing_one_action_gives_the_same_action;
var Expected,
    Actual: TArray<string>;
begin
  SetLength(Expected, 1);
  Expected[0] := 'jump';

  Actual := TSecretHandshake.commands(24);

  CompareArrays(Expected, Actual);
end;

procedure SecretHandshakeTest.wink_for_1;
var Expected,
    Actual: TArray<string>;
begin
  SetLength(Expected, 1);
  Expected[0] := 'wink';

  Actual := TSecretHandshake.commands(1);

  CompareArrays(Expected, Actual);
end;

procedure SecretHandshakeTest.CompareArrays(aExpected, aActual: TArray<string>);
var i: integer;
begin
  Assert.AreEqual(length(aExpected), length(aActual));
  for i := Low(aExpected) to High(aExpected) do
    Assert.AreEqual(aExpected[i], aActual[i]);
end;

initialization
  TDUnitX.RegisterTestFixture(SecretHandshakeTest);
end.
