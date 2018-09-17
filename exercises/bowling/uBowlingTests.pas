unit uBowlingTests;

interface
uses
  DUnitX.TestFramework,
  uBowling;

const
  CanonicalVersion = '1.2.0';

type

  [TestFixture]
  BowlingTests = class(TObject)
  private
    class function RollMany(pins: array of integer; game: IBowlingGame): IBowlingGame; static;
  public
    [Test]
//    [Ignore('Comment the "[Ignore]" statement to run the test')]
    procedure Should_be_able_to_score_a_game_with_all_zeros;

    [Test]
    [Ignore]
    procedure Should_be_able_to_score_a_game_with_no_strikes_or_spares;

    [Test]
    [Ignore]
    procedure A_spare_followed_by_zeros_is_worth_ten_points;

    [Test]
    [Ignore]
    procedure Points_scored_in_the_roll_after_a_spare_are_counted_twice;

    [Test]
    [Ignore]
    procedure Consecutive_spares_each_get_a_one_roll_bonus;

    [Test]
    [Ignore]
    procedure A_spare_in_the_last_frame_gets_a_one_roll_bonus_that_is_counted_once;

    [Test]
    [Ignore]
    procedure A_strike_earns_ten_points_in_frame_with_a_single_roll;

    [Test]
    [Ignore]
    procedure Points_scored_in_the_two_rolls_after_a_strike_are_counted_twice_as_a_bonus;

    [Test]
    [Ignore]
    procedure Consecutive_strikes_each_get_the_two_roll_bonus;

    [Test]
    [Ignore]
    procedure A_strike_in_the_last_frame_gets_a_two_roll_bonus_that_is_counted_once;

    [Test]
    [Ignore]
    procedure Rolling_a_spare_with_the_two_roll_bonus_does_not_get_a_bonus_roll;

    [Test]
    [Ignore]
    procedure Strikes_with_the_two_roll_bonus_do_not_get_bonus_rolls;

    [Test]
    [Ignore]
    procedure A_strike_with_the_one_roll_bonus_after_a_spare_in_the_last_frame_does_not_get_a_bonus;

    [Test]
    [Ignore]
    procedure All_strikes_is_a_perfect_game;

    [Test]
    [Ignore]
    procedure Rolls_cannot_score_negative_points;

    [Test]
    [Ignore]
    procedure A_roll_cannot_score_more_than_10_points;

    [Test]
    [Ignore]
    procedure Two_rolls_in_a_frame_cannot_score_more_than_10_points;

    [Test]
    [Ignore]
    procedure Bonus_roll_after_a_strike_in_the_last_frame_cannot_score_more_than_10_points;

    [Test]
    [Ignore]
    procedure Two_bonus_rolls_after_a_strike_in_the_last_frame_cannot_score_more_than_10_points;

    [Test]
    [Ignore]
    procedure Two_bonus_rolls_after_a_strike_in_the_last_frame_can_score_more_than_10_points_if_one_is_a_strike;

    [Test]
    [Ignore]
    procedure The_second_bonus_rolls_after_a_strike_in_the_last_frame_cannot_be_a_strike_if_the_first_one_is_not_a_strike;

    [Test]
    [Ignore]
    procedure Second_bonus_roll_after_a_strike_in_the_last_frame_cannot_score_more_than_10_points;

    [Test]
    [Ignore]
    procedure An_unstarted_game_cannot_be_scored;

    [Test]
    [Ignore]
    procedure An_incomplete_game_cannot_be_scored;

    [Test]
    [Ignore]
    procedure Cannot_roll_if_game_already_has_ten_frames;

    [Test]
    [Ignore]
    procedure Bonus_rolls_for_a_strike_in_the_last_frame_must_be_rolled_before_score_can_be_calculated;

    [Test]
    [Ignore]
    procedure Both_bonus_rolls_for_a_strike_in_the_last_frame_must_be_rolled_before_score_can_be_calculated;

    [Test]
    [Ignore]
    procedure Bonus_roll_for_a_spare_in_the_last_frame_must_be_rolled_before_score_can_be_calculated;

    [Test]
    [Ignore]
    procedure Cannot_roll_after_bonus_roll_for_spare;

    [Test]
    [Ignore]
    procedure Cannot_roll_after_bonus_rolls_for_strike;
  end;

implementation
uses System.SysUtils;

procedure BowlingTests.Second_bonus_roll_after_a_strike_in_the_last_frame_cannot_score_more_than_10_points;
var game: IBowlingGame;
begin
  game := RollMany([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 10], NewBowlingGame);
  Assert.IsFalse(game.Roll(11));
end;

procedure BowlingTests.Should_be_able_to_score_a_game_with_all_zeros;
var game: IBowlingGame;
begin
  game := RollMany([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], NewBowlingGame);
  assert.AreEqual(0, game.Score);
end;

procedure BowlingTests.Should_be_able_to_score_a_game_with_no_strikes_or_spares;
var game: IBowlingGame;
begin
  game := RollMany([3, 6, 3, 6, 3, 6, 3, 6, 3, 6, 3, 6, 3, 6, 3, 6, 3, 6, 3, 6], NewBowlingGame);
  assert.AreEqual(90, game.Score);
end;

procedure BowlingTests.A_spare_followed_by_zeros_is_worth_ten_points;
var game: IBowlingGame;
begin
  game := RollMany([6, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], NewBowlingGame);
  assert.AreEqual(10, game.Score);
end;

procedure BowlingTests.Points_scored_in_the_roll_after_a_spare_are_counted_twice;
var game: IBowlingGame;
begin
  game := RollMany([6, 4, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], NewBowlingGame);
  assert.AreEqual(16, game.Score);
end;

procedure BowlingTests.Consecutive_spares_each_get_a_one_roll_bonus;
var game: IBowlingGame;
begin
  game := RollMany([5, 5, 3, 7, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], NewBowlingGame);
  assert.AreEqual(31, game.Score);
end;

procedure BowlingTests.A_spare_in_the_last_frame_gets_a_one_roll_bonus_that_is_counted_once;
var game: IBowlingGame;
begin
  game := RollMany([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 3, 7], NewBowlingGame);
  assert.AreEqual(17, game.Score);
end;

procedure BowlingTests.A_strike_earns_ten_points_in_frame_with_a_single_roll;
var game: IBowlingGame;
begin
  game := RollMany([10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], NewBowlingGame);
  assert.AreEqual(10, game.Score);
end;

procedure BowlingTests.Points_scored_in_the_two_rolls_after_a_strike_are_counted_twice_as_a_bonus;
var game: IBowlingGame;
begin
  game := RollMany([10, 5, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], NewBowlingGame);
  assert.AreEqual(26, game.Score);
end;

procedure BowlingTests.Consecutive_strikes_each_get_the_two_roll_bonus;
var game: IBowlingGame;
begin
  game := RollMany([10, 10, 10, 5, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], NewBowlingGame);
  assert.AreEqual(81, game.Score);
end;

procedure BowlingTests.A_strike_in_the_last_frame_gets_a_two_roll_bonus_that_is_counted_once;
var game: IBowlingGame;
begin
  game := RollMany([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 7, 1], NewBowlingGame);
  assert.AreEqual(18, game.Score);
end;

procedure BowlingTests.Rolling_a_spare_with_the_two_roll_bonus_does_not_get_a_bonus_roll;
var game: IBowlingGame;
begin
  game := RollMany([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 7, 3], NewBowlingGame);
  assert.AreEqual(20, game.Score);
end;

procedure BowlingTests.Strikes_with_the_two_roll_bonus_do_not_get_bonus_rolls;
var game: IBowlingGame;
begin
  game := RollMany([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 10, 10], NewBowlingGame);
  assert.AreEqual(30, game.Score);
end;

procedure BowlingTests.A_strike_with_the_one_roll_bonus_after_a_spare_in_the_last_frame_does_not_get_a_bonus;
var game: IBowlingGame;
begin
  game := RollMany([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 3, 10], NewBowlingGame);
  assert.AreEqual(20, game.Score);
end;

procedure BowlingTests.All_strikes_is_a_perfect_game;
var game: IBowlingGame;
begin
  game := RollMany([10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10], NewBowlingGame);
  assert.AreEqual(300, game.Score);
end;

procedure BowlingTests.Rolls_cannot_score_negative_points;
var game: IBowlingGame;
begin
  game := RollMany([-1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], NewBowlingGame);
  Assert.AreEqual(-1, game.Score);
end;

procedure BowlingTests.A_roll_cannot_score_more_than_10_points;
var game: IBowlingGame;
begin
  game := RollMany([11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], NewBowlingGame);
  Assert.AreEqual(-1, game.Score);
end;

procedure BowlingTests.Two_rolls_in_a_frame_cannot_score_more_than_10_points;
var game: IBowlingGame;
begin
  game := RollMany([5, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], NewBowlingGame);
  Assert.AreEqual(-1, game.Score);
end;

procedure BowlingTests.The_second_bonus_rolls_after_a_strike_in_the_last_frame_cannot_be_a_strike_if_the_first_one_is_not_a_strike;
var game: IBowlingGame;
begin
  game := RollMany([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 6], NewBowlingGame);
  Assert.IsFalse(game.Roll(10));
end;

procedure BowlingTests.Two_bonus_rolls_after_a_strike_in_the_last_frame_cannot_score_more_than_10_points;
var game: IBowlingGame;
begin
  game := RollMany([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 5, 6], NewBowlingGame);
  Assert.AreEqual(-1, game.Score);
end;

procedure BowlingTests.Two_bonus_rolls_after_a_strike_in_the_last_frame_can_score_more_than_10_points_if_one_is_a_strike;
var game: IBowlingGame;
begin
  game := RollMany([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 10, 6], NewBowlingGame);
  Assert.AreEqual(26, game.Score);
end;

procedure BowlingTests.An_unstarted_game_cannot_be_scored;
var game: IBowlingGame;
begin
  game := RollMany([],NewBowlingGame);
  Assert.AreEqual(-1, game.Score);
end;

procedure BowlingTests.An_incomplete_game_cannot_be_scored;
var game: IBowlingGame;
begin
  game := RollMany([0, 0], NewBowlingGame);
  Assert.AreEqual(-1, game.Score);
end;

procedure BowlingTests.Cannot_roll_after_bonus_rolls_for_strike;
var game: IBowlingGame;
begin
  game := RollMany([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 3, 2], NewBowlingGame);
  Assert.IsFalse(game.Roll(2));
end;

procedure BowlingTests.Cannot_roll_after_bonus_roll_for_spare;
var game: IBowlingGame;
begin
  game := RollMany([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 3, 2], NewBowlingGame);
  Assert.IsFalse(game.Roll(2));
end;

procedure BowlingTests.Cannot_roll_if_game_already_has_ten_frames;
var game: IBowlingGame;
begin
  game := RollMany([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], NewBowlingGame);
  Assert.IsFalse(game.Roll(0));
end;

procedure BowlingTests.Bonus_rolls_for_a_strike_in_the_last_frame_must_be_rolled_before_score_can_be_calculated;
var game: IBowlingGame;
begin
  game := RollMany([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10], NewBowlingGame);
  Assert.AreEqual(-1, game.Score);
end;

procedure BowlingTests.Both_bonus_rolls_for_a_strike_in_the_last_frame_must_be_rolled_before_score_can_be_calculated;
var game: IBowlingGame;
begin
  game := RollMany([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 10], NewBowlingGame);
  Assert.AreEqual(-1, game.Score);
end;

procedure BowlingTests.Bonus_roll_after_a_strike_in_the_last_frame_cannot_score_more_than_10_points;
var game: IBowlingGame;
begin
  game := RollMany([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10], NewBowlingGame);
  Assert.IsFalse(game.Roll(11));
end;

procedure BowlingTests.Bonus_roll_for_a_spare_in_the_last_frame_must_be_rolled_before_score_can_be_calculated;
var game: IBowlingGame;
begin
  game := RollMany([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 3], NewBowlingGame);
  Assert.AreEqual(-1, game.Score);
end;

class function BowlingTests.RollMany(pins: array of integer; game: IBowlingGame): IBowlingGame;
var count: integer;
begin
  for count in pins do
    game.Roll(count);
  result := game;
end;

initialization
  TDUnitX.RegisterTestFixture(BowlingTests);
end.
