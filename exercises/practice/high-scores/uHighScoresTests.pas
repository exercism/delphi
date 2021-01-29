unit uHighScoresTests;

interface
uses
  DUnitX.TestFramework, uHighScores;

const
  CanonicalVersion = '4.0.0.3';

type

  [TestFixture]
  THighScoresTest = class(TObject)
  public
    [Test]
//    [Ignore('Comment the "[Ignore]" statement to run the test')]
    procedure List_of_scores;

    [Test]
    [Ignore]
    procedure Latest_score;

    [Test]
    [Ignore]
    procedure Personal_best;

    [Test]
    [Ignore]
    procedure Personal_top_three_from_a_list_of_scores;

    [Test]
    [Ignore]
    procedure Personal_top_highest_to_lowest;

    [Test]
    [Ignore]
    procedure Personal_top_when_there_is_a_tie;

    [Test]
    [Ignore]
    procedure Personal_top_when_there_are_less_than_3;

    [Test]
    [Ignore]
    procedure Personal_top_when_there_is_only_one;

    [Test]
    [Ignore('Optional Bonus')]
    procedure Message_for_new_personal_best;

    [Test]
    [Ignore('Optional Bonus')]
    procedure Message_when_latest_score_is_not_the_highest_score;

    [Test]
    [Ignore('Optional Bonus')]
    procedure Message_for_repeated_personal_best;
  end;

implementation
uses System.SysUtils, System.Generics.Collections;

type
  Assert = class(DUnitX.TestFramework.Assert)
    class procedure AreEqual(const expected: TArray<integer>; const actual: TList<integer>); overload;
  end;

procedure THighScoresTest.Personal_best;
var
  Scores: IScores;
begin
  Scores := NewScores([40, 100, 70]);
  Assert.AreEqual(100, Scores.Highest);
end;

procedure THighScoresTest.Latest_score;
var
  Scores: IScores;
begin
  Scores := NewScores([100, 0, 90, 30]);
  Assert.AreEqual(30, Scores.Latest);
end;

procedure THighScoresTest.List_of_scores;
var
  Season: IScores;
begin
  Season := NewScores([30, 50, 20, 70]);
  Assert.AreEqual([30, 50, 20, 70], Season.Scores);
end;

procedure THighScoresTest.Personal_top_three_from_a_list_of_scores;
var
  Scores: IScores;
begin
  Scores := NewScores([10, 30, 90, 30, 100, 20, 10, 0, 30, 40, 40, 70, 70]);
  Assert.AreEqual([100, 90, 70], Scores.personalTopThree);
end;

procedure THighScoresTest.Personal_top_highest_to_lowest;
var
  Scores: IScores;
begin
  Scores := NewScores([20, 10, 30]);
  Assert.AreEqual([30, 20, 10], Scores.personalTopThree);
end;

procedure THighScoresTest.Personal_top_when_there_are_less_than_3;
var
  Scores: IScores;
begin
  Scores := NewScores([30, 70]);
  Assert.AreEqual([70, 30], Scores.personalTopThree);
end;

procedure THighScoresTest.Personal_top_when_there_is_a_tie;
var
  Scores: IScores;
begin
  Scores := NewScores([40, 20, 40, 30]);
  Assert.AreEqual([40, 40, 30], Scores.personalTopThree);
end;

procedure THighScoresTest.Personal_top_when_there_is_only_one;
var
  Scores: IScores;
begin
  Scores := NewScores([40]);
  Assert.AreEqual([40], Scores.personalTopThree);
end;

{$region 'Optional Bonus'}
procedure THighScoresTest.Message_for_new_personal_best;
var
  Scores: IScores;
begin
  Scores := NewScores([20, 40, 0, 30, 70]);
  Assert.AreEqual('Your latest score was 70. That''s your personal best!',
    Scores.Report);
end;

procedure THighScoresTest.Message_when_latest_score_is_not_the_highest_score;
var
  Scores: IScores;
begin
  Scores := NewScores([20, 100, 0, 30, 70]);
  Assert.AreEqual('Your latest score was 70. That''s 30 short of your personal best!',
    Scores.Report);
end;

procedure THighScoresTest.Message_for_repeated_personal_best;
var
  Scores: IScores;
begin
  Scores := NewScores([20, 70, 50, 70, 30]);
  Assert.AreEqual('Your latest score was 30. That''s 40 short of your personal best!',
    Scores.Report);
end;
{$endregion}

{ Assert }

class procedure Assert.AreEqual(const expected: TArray<integer>; const actual: TList<integer>);
var
  i: integer;
begin
  Assert.AreEqual(length(expected), actual.Count, ' - List lengths must be equal');
  for i := Low(expected) to High(expected) do
    Assert.AreEqual(expected[i], actual[i], format('Expecting element %d to = %d, Actual = %d',
      [i, expected[i], actual[i]]));
end;

initialization
  TDUnitX.RegisterTestFixture(THighScoresTest);
end.
