unit uRobotSimulatorTests;

interface
uses
  DUnitX.TestFramework;

const
  CanonicalVersion = '3.1.0.1';

type
  [TestFixture]
  TRobotSimTest = class(TObject)
  public
    [Test]
//    [Ignore('Comment the "[Ignore]" statement to run the test')]
    procedure Robots_are_created_with_a_position_and_direction;

    [Test]
    [Ignore]
    procedure Negative_positions_are_allowed;

    [Test]
    [Ignore]
    procedure changes_the_direction_from_north_to_east;

    [Test]
    [Ignore]
    procedure changes_the_direction_from_east_to_south;

    [Test]
    [Ignore]
    procedure changes_the_direction_from_south_to_west;

    [Test]
    [Ignore]
    procedure changes_the_direction_from_west_to_north;

    [Test]
    [Ignore]
    procedure changes_the_direction_from_north_to_west;

    [Test]
    [Ignore]
    procedure changes_the_direction_from_west_to_south;

    [Test]
    [Ignore]
    procedure changes_the_direction_from_south_to_east;

    [Test]
    [Ignore]
    procedure changes_the_direction_from_east_to_north;

    [Test]
    [Ignore]
    procedure increases_the_y_coordinate_one_when_facing_north;

    [Test]
    [Ignore]
    procedure decreases_the_y_coordinate_by_one_when_facing_south;

    [Test]
    [Ignore]
    procedure increases_the_x_coordinate_by_one_when_facing_east;

    [Test]
    [Ignore]
    procedure decreases_the_x_coordinate_by_one_when_facing_west;

    [Test]
    [Ignore]
    procedure instructions_to_move_east_and_north_from_README;

    [Test]
    [Ignore]
    procedure instructions_to_move_west_and_north;

    [Test]
    [Ignore]
    procedure instructions_to_move_west_and_south;

    [Test]
    [Ignore]
    procedure instructions_to_move_east_and_north;
  end;

implementation
uses uRobotSimulator;

procedure TRobotSimTest.Negative_positions_are_allowed;
var
  Actual : TRobotSimulator;
  ExpectedCoord: TCoordinate;
begin
  ExpectedCoord := TCoordinate.Create(-1, -1);
  Actual := TRobotSimulator.Create(TDirection.south, TCoordinate.Create(-1, -1));
  Assert.AreEqual(ExpectedCoord, Actual.Coordinate);
  Assert.AreEqual(TDirection.south, Actual.Direction);
  Actual.DisposeOf;
end;

procedure TRobotSimTest.Robots_are_created_with_a_position_and_direction;
var
  Actual : TRobotSimulator;
  ExpectedCoord: TCoordinate;
begin
  ExpectedCoord := TCoordinate.Create(0, 0);
  Actual := TRobotSimulator.Create(TDirection.north, TCoordinate.Create(0, 0));
  Assert.AreEqual(ExpectedCoord, Actual.Coordinate);
  Assert.AreEqual(TDirection.north, Actual.Direction);
  Actual.DisposeOf;
end;

procedure TRobotSimTest.decreases_the_x_coordinate_by_one_when_facing_west;
var
  Actual : TRobotSimulator;
  ExpectedCoord: TCoordinate;
begin
  ExpectedCoord := TCoordinate.Create(-1, 0);
  Actual := TRobotSimulator.Create(TDirection.west, TCoordinate.Create(0, 0));
  Actual.move('A');
  Assert.AreEqual(ExpectedCoord, Actual.Coordinate);
  Assert.AreEqual(TDirection.west, Actual.Direction);
  Actual.DisposeOf;
end;

procedure TRobotSimTest.decreases_the_y_coordinate_by_one_when_facing_south;
var
  Actual : TRobotSimulator;
  ExpectedCoord: TCoordinate;
begin
  ExpectedCoord := TCoordinate.Create(0, -1);
  Actual := TRobotSimulator.Create(TDirection.south, TCoordinate.Create(0, 0));
  Actual.move('A');
  Assert.AreEqual(ExpectedCoord, Actual.Coordinate);
  Assert.AreEqual(TDirection.south, Actual.Direction);
  Actual.DisposeOf;
end;

procedure TRobotSimTest.increases_the_x_coordinate_by_one_when_facing_east;
var
  Actual : TRobotSimulator;
  ExpectedCoord: TCoordinate;
begin
  ExpectedCoord := TCoordinate.Create(1, 0);
  Actual := TRobotSimulator.Create(TDirection.east, TCoordinate.Create(0, 0));
  Actual.move('A');
  Assert.AreEqual(ExpectedCoord, Actual.Coordinate);
  Assert.AreEqual(TDirection.east, Actual.Direction);
  Actual.DisposeOf;
end;

procedure TRobotSimTest.increases_the_y_coordinate_one_when_facing_north;
var
  Actual : TRobotSimulator;
  ExpectedCoord: TCoordinate;
begin
  ExpectedCoord := TCoordinate.Create(0, 1);
  Actual := TRobotSimulator.Create(TDirection.north, TCoordinate.Create(0, 0));
  Actual.move('A');
  Assert.AreEqual(ExpectedCoord, Actual.Coordinate);
  Assert.AreEqual(TDirection.north, Actual.Direction);
  Actual.DisposeOf;
end;

procedure TRobotSimTest.changes_the_direction_from_east_to_south;
var
  Actual : TRobotSimulator;
  ExpectedCoord: TCoordinate;
begin
  ExpectedCoord := TCoordinate.Create(0, 0);
  Actual := TRobotSimulator.Create(TDirection.east, TCoordinate.Create(0, 0));
  Actual.move('R');
  Assert.AreEqual(ExpectedCoord, Actual.Coordinate);
  Assert.AreEqual(TDirection.south, Actual.Direction);
  Actual.DisposeOf;
end;

procedure TRobotSimTest.changes_the_direction_from_north_to_east;
var
  Actual : TRobotSimulator;
  ExpectedCoord: TCoordinate;
begin
  ExpectedCoord := TCoordinate.Create(0, 0);
  Actual := TRobotSimulator.Create(TDirection.north, TCoordinate.Create(0, 0));
  Actual.move('R');
  Assert.AreEqual(ExpectedCoord, Actual.Coordinate);
  Assert.AreEqual(TDirection.east, Actual.Direction);
  Actual.DisposeOf;
end;

procedure TRobotSimTest.changes_the_direction_from_south_to_west;
var
  Actual : TRobotSimulator;
  ExpectedCoord: TCoordinate;
begin
  ExpectedCoord := TCoordinate.Create(0, 0);
  Actual := TRobotSimulator.Create(TDirection.south, TCoordinate.Create(0, 0));
  Actual.move('R');
  Assert.AreEqual(ExpectedCoord, Actual.Coordinate);
  Assert.AreEqual(TDirection.west, Actual.Direction);
  Actual.DisposeOf;
end;

procedure TRobotSimTest.changes_the_direction_from_west_to_north;
var
  Actual : TRobotSimulator;
  ExpectedCoord: TCoordinate;
begin
  ExpectedCoord := TCoordinate.Create(0, 0);
  Actual := TRobotSimulator.Create(TDirection.west, TCoordinate.Create(0, 0));
  Actual.move('R');
  Assert.AreEqual(ExpectedCoord, Actual.Coordinate);
  Assert.AreEqual(TDirection.north, Actual.Direction);
  Actual.DisposeOf;
end;

procedure TRobotSimTest.changes_the_direction_from_east_to_north;
var
  Actual : TRobotSimulator;
  ExpectedCoord: TCoordinate;
begin
  ExpectedCoord := TCoordinate.Create(0, 0);
  Actual := TRobotSimulator.Create(TDirection.east, TCoordinate.Create(0, 0));
  Actual.move('L');
  Assert.AreEqual(ExpectedCoord, Actual.Coordinate);
  Assert.AreEqual(TDirection.north, Actual.Direction);
  Actual.DisposeOf;
end;

procedure TRobotSimTest.changes_the_direction_from_north_to_west;
var
  Actual : TRobotSimulator;
  ExpectedCoord: TCoordinate;
begin
  ExpectedCoord := TCoordinate.Create(0, 0);
  Actual := TRobotSimulator.Create(TDirection.north, TCoordinate.Create(0, 0));
  Actual.move('L');
  Assert.AreEqual(ExpectedCoord, Actual.Coordinate);
  Assert.AreEqual(TDirection.west, Actual.Direction);
  Actual.DisposeOf;
end;

procedure TRobotSimTest.changes_the_direction_from_south_to_east;
var
  Actual : TRobotSimulator;
  ExpectedCoord: TCoordinate;
begin
  ExpectedCoord := TCoordinate.Create(0, 0);
  Actual := TRobotSimulator.Create(TDirection.south, TCoordinate.Create(0, 0));
  Actual.move('L');
  Assert.AreEqual(ExpectedCoord, Actual.Coordinate);
  Assert.AreEqual(TDirection.east, Actual.Direction);
  Actual.DisposeOf;
end;

procedure TRobotSimTest.changes_the_direction_from_west_to_south;
var
  Actual : TRobotSimulator;
  ExpectedCoord: TCoordinate;
begin
  ExpectedCoord := TCoordinate.Create(0, 0);
  Actual := TRobotSimulator.Create(TDirection.west, TCoordinate.Create(0, 0));
  Actual.move('L');
  Assert.AreEqual(ExpectedCoord, Actual.Coordinate);
  Assert.AreEqual(TDirection.south, Actual.Direction);
  Actual.DisposeOf;
end;

procedure TRobotSimTest.instructions_to_move_east_and_north;
var
  Actual : TRobotSimulator;
  ExpectedCoord: TCoordinate;
begin
  ExpectedCoord := TCoordinate.Create(11, 5);
  Actual := TRobotSimulator.Create(TDirection.south, TCoordinate.Create(8, 4));
  Actual.move('LAAARRRALLLL');
  Assert.AreEqual(ExpectedCoord, Actual.Coordinate);
  Assert.AreEqual(TDirection.north, Actual.Direction);
  Actual.DisposeOf;
end;

procedure TRobotSimTest.instructions_to_move_east_and_north_from_README;
var
  Actual : TRobotSimulator;
  ExpectedCoord: TCoordinate;
begin
  ExpectedCoord := TCoordinate.Create(9, 4);
  Actual := TRobotSimulator.Create(TDirection.North, TCoordinate.Create(7, 3));
  Actual.move('RAALAL');
  Assert.AreEqual(ExpectedCoord, Actual.Coordinate);
  Assert.AreEqual(TDirection.west, Actual.Direction);
  Actual.DisposeOf;
end;

procedure TRobotSimTest.instructions_to_move_west_and_north;
var
  Actual : TRobotSimulator;
  ExpectedCoord: TCoordinate;
begin
  ExpectedCoord := TCoordinate.Create(-4, 1);
  Actual := TRobotSimulator.Create(TDirection.North, TCoordinate.Create(0, 0));
  Actual.move('LAAARALA');
  Assert.AreEqual(ExpectedCoord, Actual.Coordinate);
  Assert.AreEqual(TDirection.west, Actual.Direction);
  Actual.DisposeOf;
end;

procedure TRobotSimTest.instructions_to_move_west_and_south;
var
  Actual : TRobotSimulator;
  ExpectedCoord: TCoordinate;
begin
  ExpectedCoord := TCoordinate.Create(-3, -8);
  Actual := TRobotSimulator.Create(TDirection.east, TCoordinate.Create(2, -7));
  Actual.move('RRAAAAALA');
  Assert.AreEqual(ExpectedCoord, Actual.Coordinate);
  Assert.AreEqual(TDirection.south, Actual.Direction);
  Actual.DisposeOf;
end;

initialization
  TDUnitX.RegisterTestFixture(TRobotSimTest);
end.
