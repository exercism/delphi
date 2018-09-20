unit uRobotSimulator;

interface

uses System.Types;

type
  TDirection = (north, east, south, west);

  TCoordinate = TPoint;

  RobotSimulator = class
    FDirection : TDirection;
    FCoordinate : TCoordinate;
  public
    property Direction : TDirection read FDirection;
    property Coordinate : TCoordinate read FCoordinate;
    constructor Create(ADirection : TDirection; ACoord : TCoordinate);
    procedure TurnRight;
    procedure TurnLeft;
    procedure Advance;
    procedure Instructions(APath : string);
  end;

implementation

{ RobotSimulator }

procedure RobotSimulator.Advance;
begin
  case FDirection of
    north: FCoordinate.Y := Coordinate.Y + 1;
    east: FCoordinate.X := Coordinate.X + 1;
    south: FCoordinate.Y := Coordinate.Y - 1;
    west: FCoordinate.X := Coordinate.X - 1;
  end;
end;

constructor RobotSimulator.Create(ADirection: TDirection; ACoord: TCoordinate);
begin
  FDirection := ADirection;
  FCoordinate := ACoord;
end;

procedure RobotSimulator.Instructions(APath: string);
var
  C: char;
begin
  for C in APath do
  begin
    case c of
      'L' : TurnLeft;
      'R' : TurnRight;
      'A' : Advance;
    end;
  end;
end;

procedure RobotSimulator.TurnLeft;
begin
  FDirection := TDirection(((ord(FDirection) + 3)) mod 4);
end;

procedure RobotSimulator.TurnRight;
begin
  FDirection := TDirection((ord(FDirection) + 1) mod 4);
end;

end.
