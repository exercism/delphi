unit uTournamentTests;

interface
uses
  DUnitX.TestFramework;

const
  CanonicalVersion = '1.4.0.1';

type
  [TestFixture]
  TMyTestObject = class(TObject)
  private
    procedure CompareArrays(Array1, Array2: TArray<string>);
  public
    [Test]
//    [Ignore('Comment the "[Ignore]" statement to run the test')]
    procedure just_the_header_if_no_input;

    [Test]
    [Ignore]
    procedure win_is_three_points_a_loss_is_zero_points;

    [Test]
    [Ignore]
    procedure win_can_also_be_expressed_as_a_loss;

    [Test]
    [Ignore]
    procedure different_team_can_win;

    [Test]
    [Ignore]
    procedure draw_is_one_point_each;

    [Test]
    [Ignore]
    procedure There_can_be_more_than_one_match;

    [Test]
    [Ignore]
    procedure There_can_be_more_than_one_winner;

    [Test]
    [Ignore]
    procedure There_can_be_more_than_two_teams;

    [Test]
    [Ignore]
    procedure typical_input;

    [Test]
    [Ignore]
    procedure incomplete_competition_not_all_pairs_have_played;

    [Test]
    [Ignore]
    procedure ties_broken_alphabetically;
  end;

implementation

uses
  System.SysUtils, uTournament;

procedure TMyTestObject.There_can_be_more_than_one_match;
begin
  CompareArrays(
    ['Team                           | MP |  W |  D |  L |  P',
     'Allegoric Alaskans             |  2 |  2 |  0 |  0 |  6',
     'Blithering Badgers             |  2 |  0 |  0 |  2 |  0'],
     TTournament.Tally([
          'Allegoric Alaskans;Blithering Badgers;win',
          'Allegoric Alaskans;Blithering Badgers;win']));
end;

procedure TMyTestObject.There_can_be_more_than_one_winner;
begin
  CompareArrays(
    ['Team                           | MP |  W |  D |  L |  P',
     'Allegoric Alaskans             |  2 |  1 |  0 |  1 |  3',
     'Blithering Badgers             |  2 |  1 |  0 |  1 |  3'],
     TTournament.Tally([
          'Allegoric Alaskans;Blithering Badgers;loss',
          'Allegoric Alaskans;Blithering Badgers;win']));
end;

procedure TMyTestObject.There_can_be_more_than_two_teams;
begin
  CompareArrays(
    ['Team                           | MP |  W |  D |  L |  P',
     'Allegoric Alaskans             |  2 |  2 |  0 |  0 |  6',
     'Blithering Badgers             |  2 |  1 |  0 |  1 |  3',
     'Courageous Californians        |  2 |  0 |  0 |  2 |  0'],
     TTournament.Tally([
          'Allegoric Alaskans;Blithering Badgers;win',
          'Blithering Badgers;Courageous Californians;win',
          'Courageous Californians;Allegoric Alaskans;loss']));
end;

procedure TMyTestObject.typical_input;
begin
  CompareArrays(
    ['Team                           | MP |  W |  D |  L |  P',
     'Devastating Donkeys            |  3 |  2 |  1 |  0 |  7',
     'Allegoric Alaskans             |  3 |  2 |  0 |  1 |  6',
     'Blithering Badgers             |  3 |  1 |  0 |  2 |  3',
     'Courageous Californians        |  3 |  0 |  1 |  2 |  1'],
     TTournament.Tally([
          'Allegoric Alaskans;Blithering Badgers;win',
          'Devastating Donkeys;Courageous Californians;draw',
          'Devastating Donkeys;Allegoric Alaskans;win',
          'Courageous Californians;Blithering Badgers;loss',
          'Blithering Badgers;Devastating Donkeys;loss',
          'Allegoric Alaskans;Courageous Californians;win']));
end;

procedure TMyTestObject.win_can_also_be_expressed_as_a_loss;
begin
  CompareArrays(
    ['Team                           | MP |  W |  D |  L |  P',
     'Allegoric Alaskans             |  1 |  1 |  0 |  0 |  3',
     'Blithering Badgers             |  1 |  0 |  0 |  1 |  0'],
     TTournament.Tally(['Blithering Badgers;Allegoric Alaskans;loss']));
end;

procedure TMyTestObject.win_is_three_points_a_loss_is_zero_points;
begin
  CompareArrays(
    ['Team                           | MP |  W |  D |  L |  P',
     'Allegoric Alaskans             |  1 |  1 |  0 |  0 |  3',
     'Blithering Badgers             |  1 |  0 |  0 |  1 |  0'],
     TTournament.Tally(['Allegoric Alaskans;Blithering Badgers;win']));
end;

procedure TMyTestObject.CompareArrays(Array1, Array2: TArray<string>);
var
  i: integer;
begin
  Assert.AreEqual(Length(Array1), Length(Array2), ' - Array lengths must be equal');
  for i := Low(Array1) to High(Array1) do
    Assert.AreEqual(Array1[i], Array2[i], format('Expecting element %d to = %s, Actual = %s', [i, Array1[i], Array2[i]]));
end;

procedure TMyTestObject.different_team_can_win;
begin
   CompareArrays(
    ['Team                           | MP |  W |  D |  L |  P',
     'Blithering Badgers             |  1 |  1 |  0 |  0 |  3',
     'Allegoric Alaskans             |  1 |  0 |  0 |  1 |  0'],
     TTournament.Tally(['Blithering Badgers;Allegoric Alaskans;win']));
end;

procedure TMyTestObject.draw_is_one_point_each;
begin
   CompareArrays(
    ['Team                           | MP |  W |  D |  L |  P',
     'Allegoric Alaskans             |  1 |  0 |  1 |  0 |  1',
     'Blithering Badgers             |  1 |  0 |  1 |  0 |  1'],
     TTournament.Tally(['Allegoric Alaskans;Blithering Badgers;draw']));
end;

procedure TMyTestObject.incomplete_competition_not_all_pairs_have_played;
begin
  CompareArrays(
    ['Team                           | MP |  W |  D |  L |  P',
     'Allegoric Alaskans             |  3 |  2 |  0 |  1 |  6',
     'Blithering Badgers             |  2 |  1 |  1 |  0 |  4',
     'Courageous Californians        |  2 |  0 |  1 |  1 |  1',
     'Devastating Donkeys            |  1 |  0 |  0 |  1 |  0'],
     TTournament.Tally([
          'Allegoric Alaskans;Blithering Badgers;loss',
          'Devastating Donkeys;Allegoric Alaskans;loss',
          'Courageous Californians;Blithering Badgers;draw',
          'Allegoric Alaskans;Courageous Californians;win']));
end;

procedure TMyTestObject.just_the_header_if_no_input;
begin
  CompareArrays(TTournament.Tally([]),['Team                           | MP |  W |  D |  L |  P']);
end;

procedure TMyTestObject.ties_broken_alphabetically;
begin
CompareArrays(
    ['Team                           | MP |  W |  D |  L |  P',
     'Allegoric Alaskans             |  3 |  2 |  1 |  0 |  7',
     'Courageous Californians        |  3 |  2 |  1 |  0 |  7',
     'Blithering Badgers             |  3 |  0 |  1 |  2 |  1',
     'Devastating Donkeys            |  3 |  0 |  1 |  2 |  1'],
     TTournament.Tally([
          'Courageous Californians;Devastating Donkeys;win',
          'Allegoric Alaskans;Blithering Badgers;win',
          'Devastating Donkeys;Allegoric Alaskans;loss',
          'Courageous Californians;Blithering Badgers;win',
          'Blithering Badgers;Devastating Donkeys;draw',
          'Allegoric Alaskans;Courageous Californians;draw']));
end;

initialization
  TDUnitX.RegisterTestFixture(TMyTestObject);
end.
