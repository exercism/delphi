unit uProverbTests;

interface
uses
  DUnitX.TestFramework;

const
  CanonicalVersion = '1.1.0';

type

  [TestFixture]
  ProverbTest = class(TObject)
  private
    procedure CompareExpectedAndActual(aExpected, aActual: array of string);
  public
    [Test]
//    [Ignore('Comment the "[Ignore]" statement to run the test')]
    procedure zero_pieces;

    [Test]
    [Ignore]
    procedure one_piece;

    [Test]
    [Ignore]
    procedure two_pieces;

    [Test]
    [Ignore]
    procedure three_pieces;

    [Test]
    [Ignore]
    procedure full_proverb;

    [Test]
    [Ignore]
    procedure four_pieces_modernized;
  end;

implementation
uses uProverb;

{ ProverbTest }

procedure ProverbTest.CompareExpectedAndActual(aExpected,
  aActual: array of string);
var
  i: integer;
begin
  Assert.AreEqual(length(aExpected), length(aActual));
  for i := Low(aExpected) to High(aExpected) do
    Assert.AreEqual(aExpected[i], aActual[i]);
end;

procedure ProverbTest.four_pieces_modernized;
var
  Expected: Array of string;
begin
  SetLength(Expected, 4);
  Expected [0] := 'For want of a pin the gun was lost.';
  Expected [1] := 'For want of a gun the soldier was lost.';
  Expected [2] := 'For want of a soldier the battle was lost.';
  Expected [3] := 'And all for the want of a pin.';
  CompareExpectedAndActual(Expected, Proverb(['pin','gun','soldier','battle']).recite);
end;

procedure ProverbTest.full_proverb;
var
  Expected: Array of string;
begin
  SetLength(Expected, 7);
  Expected[0] := 'For want of a nail the shoe was lost.';
  Expected[1] := 'For want of a shoe the horse was lost.';
  Expected[2] := 'For want of a horse the rider was lost.';
  Expected[3] := 'For want of a rider the message was lost.';
  Expected[4] := 'For want of a message the battle was lost.';
  Expected[5] := 'For want of a battle the kingdom was lost.';
  Expected[6] := 'And all for the want of a nail.';
  CompareExpectedAndActual(Expected, Proverb(['nail','shoe','horse','rider','message','battle','kingdom']).recite);
end;

procedure ProverbTest.one_piece;
var
  Expected: Array of string;
begin
  SetLength(Expected, 1);
  Expected[0] := 'And all for the want of a nail.';
  CompareExpectedAndActual(Expected, Proverb(['nail']).recite);
end;

procedure ProverbTest.three_pieces;
var
  Expected: Array of string;
begin
  SetLength(Expected, 3);
  Expected[0] := 'For want of a nail the shoe was lost.';
  Expected[1] := 'For want of a shoe the horse was lost.';
  Expected[2] := 'And all for the want of a nail.';
  CompareExpectedAndActual(Expected, Proverb(['nail','shoe','horse']).recite);
end;

procedure ProverbTest.two_pieces;
var
  Expected: Array of string;
begin
  SetLength(Expected, 2);
  Expected[0] := 'For want of a nail the shoe was lost.';
  Expected[1] := 'And all for the want of a nail.';
  CompareExpectedAndActual(Expected, Proverb(['nail','shoe']).recite);
end;

procedure ProverbTest.zero_pieces;
var
  Expected: Array of string;
begin
  SetLength(Expected, 0);
  CompareExpectedAndActual(Expected, Proverb([]).recite);
end;

initialization
  TDUnitX.RegisterTestFixture(ProverbTest);
end.
