unit uRobotSimulatorTest;

interface
uses
  DUnitX.TestFramework, uRobotSimulator;

const
  CanonicalVersion = '2.3.0';

type
  [TestFixture]
  TRobotSimTest = class(TObject)
  public
    [Test]
//    [Ignore('Comment the "[Ignore]" statement to run the test')]
    procedure A_robot_is_created_with_a_position_and_a_direction_Robots_are_created_with_a_position_and_direction;

    [Test]
    [Ignore]
    procedure A_robot_is_created_with_a_position_and_a_direction_negative_positions_are_allowed;

    [Test]
    [Ignore]
    procedure Rotates_the_robots_direction_90_degrees_clockwise_changes_the_direction_from_north_to_east;

    [Test]
    [Ignore]
    procedure Rotates_the_robots_direction_90_degrees_clockwise_changes_the_direction_from_east_to_south;

    [Test]
    [Ignore]
    procedure Rotates_the_robots_direction_90_degrees_clockwise_changes_the_direction_from_south_to_west;

    [Test]
    [Ignore]
    procedure Rotates_the_robots_direction_90_degrees_clockwise_changes_the_direction_from_west_to_north;

    [Test]
    [Ignore]
    procedure Rotates_the_robots_direction_90_degrees_counter_clockwise_changes_the_direction_from_north_to_west;

    [Test]
    [Ignore]
    procedure Rotates_the_robots_direction_90_degrees_counter_clockwise_changes_the_direction_from_west_to_south;

    [Test]
    [Ignore]
    procedure Rotates_the_robots_direction_90_degrees_counter_clockwise_changes_the_direction_from_south_to_east;

    [Test]
    [Ignore]
    procedure Rotates_the_robots_direction_90_degrees_counter_clockwise_changes_the_direction_from_east_to_north;

    [Test]
    [Ignore]
    procedure Moves_the_robot_forward_1_space_in_the_direction_it_is_pointing_increases_the_y_coordinate_one_when_facing_north;

    [Test]
    [Ignore]
    procedure Moves_the_robot_forward_1_space_in_the_direction_it_is_pointing_decreases_the_y_coordinate_by_one_when_facing_south;

    [Test]
    [Ignore]
    procedure Moves_the_robot_forward_1_space_in_the_direction_it_is_pointing_increases_the_x_coordinate_by_one_when_facing_east;

    [Test]
    [Ignore]
    procedure Moves_the_robot_forward_1_space_in_the_direction_it_is_pointing_decreases_the_x_coordinate_by_one_when_facing_west;

    [Test]
    [Ignore]
    procedure Where_r_turn_right_l_turn_left_and_a_advance_the_robot_can_follow_a_series_of_instructions_and_end_up_with_the_correct_position_and_direction_instructions_to_move_west_and_north();

    [Test]
    [Ignore]
    procedure Where_r_turn_right_l_turn_left_and_a_advance_the_robot_can_follow_a_series_of_instructions_and_end_up_with_the_correct_position_and_direction_instructions_to_move_west_and_south;

    [Test]
    [Ignore]
    procedure Where_r_turn_right_l_turn_left_and_a_advance_the_robot_can_follow_a_series_of_instructions_and_end_up_with_the_correct_position_and_direction_instructions_to_move_east_and_north;

  end;

implementation

procedure TRobotSimTest.A_robot_is_created_with_a_position_and_a_direction_negative_positions_are_allowed;
var Actual : RobotSimulator;
begin
  Actual := RobotSimulator.Create(TDirection.south, TCoordinate.Create(-1, -1));
  Assert.AreEqual(-1, Actual.Coordinate.X);
  Assert.AreEqual(-1, Actual.Coordinate.Y);
  Assert.AreEqual(TDirection.south, Actual.Direction);
  Actual.DisposeOf;
end;

procedure TRobotSimTest.A_robot_is_created_with_a_position_and_a_direction_Robots_are_created_with_a_position_and_direction;
var Actual : RobotSimulator;
begin
  Actual := RobotSimulator.Create(TDirection.north, TCoordinate.Create(0, 0));
  Assert.AreEqual(0, Actual.Coordinate.X);
  Assert.AreEqual(0, Actual.Coordinate.Y);
  Assert.AreEqual(TDirection.north, Actual.Direction);
  Actual.DisposeOf;
end;

procedure TRobotSimTest.Moves_the_robot_forward_1_space_in_the_direction_it_is_pointing_decreases_the_x_coordinate_by_one_when_facing_west;
var Actual : RobotSimulator;
begin
  Actual := RobotSimulator.Create(TDirection.west, TCoordinate.Create(0, 0));
  Actual.Advance;
  Assert.AreEqual(-1, Actual.Coordinate.X);
  Assert.AreEqual(0, Actual.Coordinate.Y);
  Assert.AreEqual(TDirection.west, Actual.Direction);
  Actual.DisposeOf;
end;

procedure TRobotSimTest.Moves_the_robot_forward_1_space_in_the_direction_it_is_pointing_decreases_the_y_coordinate_by_one_when_facing_south;
var Actual : RobotSimulator;
begin
  Actual := RobotSimulator.Create(TDirection.south, TCoordinate.Create(0, 0));
  Actual.Advance;
  Assert.AreEqual(0, Actual.Coordinate.X);
  Assert.AreEqual(-1, Actual.Coordinate.Y);
  Assert.AreEqual(TDirection.south, Actual.Direction);
  Actual.DisposeOf;
end;

procedure TRobotSimTest.Moves_the_robot_forward_1_space_in_the_direction_it_is_pointing_increases_the_x_coordinate_by_one_when_facing_east;
var Actual : RobotSimulator;
begin
  Actual := RobotSimulator.Create(TDirection.east, TCoordinate.Create(0, 0));
  Actual.Advance;
  Assert.AreEqual(1, Actual.Coordinate.X);
  Assert.AreEqual(0, Actual.Coordinate.Y);
  Assert.AreEqual(TDirection.east, Actual.Direction);
  Actual.DisposeOf;
end;

procedure TRobotSimTest.Moves_the_robot_forward_1_space_in_the_direction_it_is_pointing_increases_the_y_coordinate_one_when_facing_north;
var Actual : RobotSimulator;
begin
  Actual := RobotSimulator.Create(TDirection.north, TCoordinate.Create(0, 0));
  Actual.Advance;
  Assert.AreEqual(0, Actual.Coordinate.X);
  Assert.AreEqual(1, Actual.Coordinate.Y);
  Assert.AreEqual(TDirection.north, Actual.Direction);
  Actual.DisposeOf;
end;

procedure TRobotSimTest.Rotates_the_robots_direction_90_degrees_clockwise_changes_the_direction_from_east_to_south;
var Actual : RobotSimulator;
begin
  Actual := RobotSimulator.Create(TDirection.east, TCoordinate.Create(0, 0));
  Actual.TurnRight;
  Assert.AreEqual(0, Actual.Coordinate.X);
  Assert.AreEqual(0, Actual.Coordinate.Y);
  Assert.AreEqual(TDirection.south, Actual.Direction);
  Actual.DisposeOf;
end;

procedure TRobotSimTest.Rotates_the_robots_direction_90_degrees_clockwise_changes_the_direction_from_north_to_east;
var Actual : RobotSimulator;
begin
  Actual := RobotSimulator.Create(TDirection.north, TCoordinate.Create(0, 0));
  Actual.TurnRight;
  Assert.AreEqual(0, Actual.Coordinate.X);
  Assert.AreEqual(0, Actual.Coordinate.Y);
  Assert.AreEqual(TDirection.east, Actual.Direction);
  Actual.DisposeOf;
end;

procedure TRobotSimTest.Rotates_the_robots_direction_90_degrees_clockwise_changes_the_direction_from_south_to_west;
var Actual : RobotSimulator;
begin
  Actual := RobotSimulator.Create(TDirection.south, TCoordinate.Create(0, 0));
  Actual.TurnRight;
  Assert.AreEqual(0, Actual.Coordinate.X);
  Assert.AreEqual(0, Actual.Coordinate.Y);
  Assert.AreEqual(TDirection.west, Actual.Direction);
  Actual.DisposeOf;
end;

procedure TRobotSimTest.Rotates_the_robots_direction_90_degrees_clockwise_changes_the_direction_from_west_to_north;
var Actual : RobotSimulator;
begin
  Actual := RobotSimulator.Create(TDirection.west, TCoordinate.Create(0, 0));
  Actual.TurnRight;
  Assert.AreEqual(0, Actual.Coordinate.X);
  Assert.AreEqual(0, Actual.Coordinate.Y);
  Assert.AreEqual(TDirection.north, Actual.Direction);
  Actual.DisposeOf;
end;

procedure TRobotSimTest.Rotates_the_robots_direction_90_degrees_counter_clockwise_changes_the_direction_from_east_to_north;
var Actual : RobotSimulator;
begin
  Actual := RobotSimulator.Create(TDirection.east, TCoordinate.Create(0, 0));
  Actual.TurnLeft;
  Assert.AreEqual(0, Actual.Coordinate.X);
  Assert.AreEqual(0, Actual.Coordinate.Y);
  Assert.AreEqual(TDirection.north, Actual.Direction);
  Actual.DisposeOf;
end;

procedure TRobotSimTest.Rotates_the_robots_direction_90_degrees_counter_clockwise_changes_the_direction_from_north_to_west;
var Actual : RobotSimulator;
begin
  Actual := RobotSimulator.Create(TDirection.north, TCoordinate.Create(0, 0));
  Actual.TurnLeft;
  Assert.AreEqual(0, Actual.Coordinate.X);
  Assert.AreEqual(0, Actual.Coordinate.Y);
  Assert.AreEqual(TDirection.west, Actual.Direction);
  Actual.DisposeOf;
end;

procedure TRobotSimTest.Rotates_the_robots_direction_90_degrees_counter_clockwise_changes_the_direction_from_south_to_east;
var Actual : RobotSimulator;
begin
  Actual := RobotSimulator.Create(TDirection.south, TCoordinate.Create(0, 0));
  Actual.TurnLeft;
  Assert.AreEqual(0, Actual.Coordinate.X);
  Assert.AreEqual(0, Actual.Coordinate.Y);
  Assert.AreEqual(TDirection.east, Actual.Direction);
  Actual.DisposeOf;
end;

procedure TRobotSimTest.Rotates_the_robots_direction_90_degrees_counter_clockwise_changes_the_direction_from_west_to_south;
var Actual : RobotSimulator;
begin
  Actual := RobotSimulator.Create(TDirection.west, TCoordinate.Create(0, 0));
  Actual.TurnLeft;
  Assert.AreEqual(0, Actual.Coordinate.X);
  Assert.AreEqual(0, Actual.Coordinate.Y);
  Assert.AreEqual(TDirection.south, Actual.Direction);
  Actual.DisposeOf;
end;

procedure TRobotSimTest.Where_r_turn_right_l_turn_left_and_a_advance_the_robot_can_follow_a_series_of_instructions_and_end_up_with_the_correct_position_and_direction_instructions_to_move_east_and_north;
var Actual : RobotSimulator;
begin
  Actual := RobotSimulator.Create(TDirection.south, TCoordinate.Create(8, 4));
  Actual.Instructions('LAAARRRALLLL');
  Assert.AreEqual(11, Actual.Coordinate.X);
  Assert.AreEqual(5, Actual.Coordinate.Y);
  Assert.AreEqual(TDirection.north, Actual.Direction);
  Actual.DisposeOf;
end;

procedure TRobotSimTest.Where_r_turn_right_l_turn_left_and_a_advance_the_robot_can_follow_a_series_of_instructions_and_end_up_with_the_correct_position_and_direction_instructions_to_move_west_and_north;
var Actual : RobotSimulator;
begin
  Actual := RobotSimulator.Create(TDirection.North, TCoordinate.Create(0, 0));
  Actual.Instructions('LAAARALA');
  Assert.AreEqual(-4, Actual.Coordinate.X);
  Assert.AreEqual(1, Actual.Coordinate.Y);
  Assert.AreEqual(TDirection.west, Actual.Direction);
  Actual.DisposeOf;
end;

procedure TRobotSimTest.Where_r_turn_right_l_turn_left_and_a_advance_the_robot_can_follow_a_series_of_instructions_and_end_up_with_the_correct_position_and_direction_instructions_to_move_west_and_south;
var Actual : RobotSimulator;
begin
  Actual := RobotSimulator.Create(TDirection.east, TCoordinate.Create(2, -7));
  Actual.Instructions('RRAAAAALA');
  Assert.AreEqual(-3, Actual.Coordinate.X);
  Assert.AreEqual(-8, Actual.Coordinate.Y);
  Assert.AreEqual(TDirection.south, Actual.Direction);
  Actual.DisposeOf;
end;

initialization
  TDUnitX.RegisterTestFixture(TRobotSimTest);
end.
