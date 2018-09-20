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
//    [Ignore]
    procedure A_robot_is_created_with_a_position_and_a_direction_negative_positions_are_allowed;

    [Test]
//    [Ignore]
    procedure Rotates_the_robots_direction_90_degrees_clockwise_changes_the_direction_from_north_to_east;

    [Test]
//    [Ignore]
    procedure Rotates_the_robots_direction_90_degrees_clockwise_changes_the_direction_from_east_to_south;

    [Test]
//    [Ignore]
    procedure Rotates_the_robots_direction_90_degrees_clockwise_changes_the_direction_from_south_to_west;

    [Test]
//    [Ignore]
    procedure Rotates_the_robots_direction_90_degrees_clockwise_changes_the_direction_from_west_to_north;

    [Test]
//    [Ignore]
    procedure Rotates_the_robots_direction_90_degrees_counter_clockwise_changes_the_direction_from_north_to_west;

    [Test]
//    [Ignore]
    procedure Rotates_the_robots_direction_90_degrees_counter_clockwise_changes_the_direction_from_west_to_south;

    [Test]
//    [Ignore]
    procedure Rotates_the_robots_direction_90_degrees_counter_clockwise_changes_the_direction_from_south_to_east;

    [Test]
//    [Ignore]
    procedure Rotates_the_robots_direction_90_degrees_counter_clockwise_changes_the_direction_from_east_to_north;

    [Test]
//    [Ignore]
    procedure Moves_the_robot_forward_1_space_in_the_direction_it_is_pointing_increases_the_y_coordinate_one_when_facing_north;

    [Test]
//    [Ignore]
    procedure Moves_the_robot_forward_1_space_in_the_direction_it_is_pointing_decreases_the_y_coordinate_by_one_when_facing_south;

    [Test]
//    [Ignore]
    procedure Moves_the_robot_forward_1_space_in_the_direction_it_is_pointing_increases_the_x_coordinate_by_one_when_facing_east;

    [Test]
//    [Ignore]
    procedure Moves_the_robot_forward_1_space_in_the_direction_it_is_pointing_decreases_the_x_coordinate_by_one_when_facing_west;

    [Test]
//    [Ignore]
    procedure Where_r_turn_right_l_turn_left_and_a_advance_the_robot_can_follow_a_series_of_instructions_and_end_up_with_the_correct_position_and_direction_instructions_to_move_west_and_north();

    [Test]
//    [Ignore]
    procedure Where_r_turn_right_l_turn_left_and_a_advance_the_robot_can_follow_a_series_of_instructions_and_end_up_with_the_correct_position_and_direction_instructions_to_move_west_and_south;

    [Test]
//    [Ignore]
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
(*
        {
          "description": "Negative positions are allowed",
          "property": "create",
          "input": {
            "position": {
              "x": -1,
              "y": -1
            },
            "direction": "south"
          },
          "expected": {
            "position": {
              "x": -1,
              "y": -1
            },
            "direction": "south"
          }
        }
*)
end;

procedure TRobotSimTest.A_robot_is_created_with_a_position_and_a_direction_Robots_are_created_with_a_position_and_direction;
var Actual : RobotSimulator;
begin
  Actual := RobotSimulator.Create(TDirection.north, TCoordinate.Create(0, 0));
  Assert.AreEqual(0, Actual.Coordinate.X);
  Assert.AreEqual(0, Actual.Coordinate.Y);
  Assert.AreEqual(TDirection.north, Actual.Direction);
  Actual.DisposeOf;
(*
        {
          "description": "Robots are created with a position and direction",
          "property": "create",
          "input": {
            "position": {
              "x": 0,
              "y": 0
            },
            "direction": "north"
          },
          "expected": {
            "position": {
              "x": 0,
              "y": 0
            },
            "direction": "north"
          }
        }
*)
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
(*
        {
          "description": "decreases the x coordinate by one when facing west",
          "property": "advance",
          "input": {
            "position": {
              "x": 0,
              "y": 0
            },
            "direction": "west"
          },
          "expected": {
            "position": {
              "x": -1,
              "y": 0
            },
            "direction": "west"
          }
        }
*)
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
(*
        {
          "description": "decreases the y coordinate by one when facing south",
          "property": "advance",
          "input": {
            "position": {
              "x": 0,
              "y": 0
            },
            "direction": "south"
          },
          "expected": {
            "position": {
              "x": 0,
              "y": -1
            },
            "direction": "south"
          }
        },
*)
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
(*
        {
          "description": "increases the x coordinate by one when facing east",
          "property": "advance",
          "input": {
            "position": {
              "x": 0,
              "y": 0
            },
            "direction": "east"
          },
          "expected": {
            "position": {
              "x": 1,
              "y": 0
            },
            "direction": "east"
          }
        },
*)
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
(*
        {
          "description": "increases the y coordinate one when facing north",
          "property": "advance",
          "input": {
            "position": {
              "x": 0,
              "y": 0
            },
            "direction": "north"
          },
          "expected": {
            "position": {
              "x": 0,
              "y": 1
            },
            "direction": "north"
          }
        },
*)
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
(*
        {
          "description": "changes the direction from east to south",
          "property": "turnRight",
          "input": {
            "position": {
              "x": 0,
              "y": 0
            },
            "direction": "east"
          },
          "expected": {
            "position": {
              "x": 0,
              "y": 0
            },
            "direction": "south"
          }
        },
*)
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
(*
        {
          "description": "changes the direction from north to east",
          "property": "turnRight",
          "input": {
            "position": {
              "x": 0,
              "y": 0
            },
            "direction": "north"
          },
          "expected": {
            "position": {
              "x": 0,
              "y": 0
            },
            "direction": "east"
          }
        }
*)
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
(*
        {
          "description": "changes the direction from south to west",
          "property": "turnRight",
          "input": {
            "position": {
              "x": 0,
              "y": 0
            },
            "direction": "south"
          },
          "expected": {
            "position": {
              "x": 0,
              "y": 0
            },
            "direction": "west"
          }
        },
*)
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
(*
        {
          "description": "changes the direction from west to north",
          "property": "turnRight",
          "input": {
            "position": {
              "x": 0,
              "y": 0
            },
            "direction": "west"
          },
          "expected": {
            "position": {
              "x": 0,
              "y": 0
            },
            "direction": "north"
          }
        }
*)
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
(*
        {
          "description": "changes the direction from east to north",
          "property": "turnLeft",
          "input": {
            "position": {
              "x": 0,
              "y": 0
            },
            "direction": "east"
          },
          "expected": {
            "position": {
              "x": 0,
              "y": 0
            },
            "direction": "north"
          }
        }
*)
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
(*
        {
          "description": "changes the direction from north to west",
          "property": "turnLeft",
          "input": {
            "position": {
              "x": 0,
              "y": 0
            },
            "direction": "north"
          },
          "expected": {
            "position": {
              "x": 0,
              "y": 0
            },
            "direction": "west"
          }
        },
*)
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
(*
        {
          "description": "changes the direction from south to east",
          "property": "turnLeft",
          "input": {
            "position": {
              "x": 0,
              "y": 0
            },
            "direction": "south"
          },
          "expected": {
            "position": {
              "x": 0,
              "y": 0
            },
            "direction": "east"
          }
        },
*)
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
(*
{
          "description": "changes the direction from west to south",
          "property": "turnLeft",
          "input": {
            "position": {
              "x": 0,
              "y": 0
            },
            "direction": "west"
          },
          "expected": {
            "position": {
              "x": 0,
              "y": 0
            },
            "direction": "south"
          }
        },
*)
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
(*
        {
          "description": "instructions to move east and north",
          "property": "instructions",
          "input": {
            "position": {
              "x": 8,
              "y": 4
            },
            "direction": "south",
            "instructions": "LAAARRRALLLL"
          },
          "expected": {
            "position": {
              "x": 11,
              "y": 5
            },
            "direction": "north"
          }
        }
*)
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
(*
        {
          "description": "instructions to move west and north",
          "property": "instructions",
          "input": {
            "position": {
              "x": 0,
              "y": 0
            },
            "direction": "north",
            "instructions": "LAAARALA"
          },
          "expected": {
            "position": {
              "x": -4,
              "y": 1
            },
            "direction": "west"
          }
        },
*)
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
(*
        {
          "description": "instructions to move west and south",
          "property": "instructions",
          "input": {
            "position": {
              "x": 2,
              "y": -7
            },
            "direction": "east",
            "instructions": "RRAAAAALA"
          },
          "expected": {
            "position": {
              "x": -3,
              "y": -8
            },
            "direction": "south"
          }
        },
*)
end;

initialization
  TDUnitX.RegisterTestFixture(TRobotSimTest);
end.
