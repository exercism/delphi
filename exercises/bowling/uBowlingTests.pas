unit uBowlingTests;

interface
uses
  DUnitX.TestFramework,
  uBowling;

type

  [TestFixture]
  BowlingTests = class(TObject)
  private
    class procedure RollMany(pins: integer; count: integer; game: IBowlingGame); static;
    class procedure RollSpare(game: IBowlingGame); static;
    class procedure RollStrike(game: IBowlingGame); static;
  public
    [Test]
    [Ignore]
    procedure Gutter_game;
    [Test]
    [Ignore]
    procedure All_ones_game;
    [Test]
    [Ignore]
    procedure One_spare_game;
    [Test]
    [Ignore]
    procedure One_strike_game;
    [Test]
    [Ignore]
    procedure Perfect_game;
  end;

implementation

procedure BowlingTests.Gutter_game;
var game: IBowlingGame;
begin
  game := NewBowlingGame;
  RollMany(0,20,game);
  assert.AreEqual(0,game.Score);
end;

procedure BowlingTests.All_ones_game;
var game: IBowlingGame;
begin
  game := NewBowlingGame;
  RollMany(1, 20, game);
  assert.AreEqual(20,game.Score);
end;

procedure BowlingTests.One_spare_game;
var game: IBowlingGame;
begin
  game := NewBowlingGame;
  RollSpare(game);
  game.Roll(3);
  RollMany(0, 17, game);
  assert.AreEqual(16, game.Score);
end;

procedure BowlingTests.One_strike_game;
var game: IBowlingGame;
begin
  game := NewBowlingGame;
  RollStrike(game);
  game.Roll(3);
  game.Roll(4);
  RollMany(0, 16, game);
  assert.AreEqual(24, game.Score);
end;

procedure BowlingTests.Perfect_game;
var game: IBowlingGame;
begin
  game := NewBowlingGame;
  RollMany(10, 12, game);
  assert.AreEqual(300, Game.Score);
end;

class procedure BowlingTests.RollMany(pins: integer; count: integer; game: IBowlingGame);
var i: integer;
begin
  for i := 0 to count - 1 do
    game.Roll(pins);
end;

class procedure BowlingTests.RollSpare(game: IBowlingGame);
begin
  game.Roll(5);
  game.Roll(5);
end;

class procedure BowlingTests.RollStrike(game: IBowlingGame);
begin
  game.Roll(10);
end;

initialization
  TDUnitX.RegisterTestFixture(BowlingTests);
end.
