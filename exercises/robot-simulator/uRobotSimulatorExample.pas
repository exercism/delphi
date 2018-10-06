unit uRobotSimulator;

interface

type
  TDirection = (north, east, south, west);

  TCoordinate = record
  private
    fX: integer;
    fY: integer;
  public
    constructor create(aX, aY: integer);
    property X: integer read fX;
    property Y: integer read fY;
  end;

  TRobotSimulator = class
  private
    FDirection: TDirection;
    FCoordinate: TCoordinate;
    procedure TurnRight;
    procedure TurnLeft;
    procedure Advance;
  public
    constructor Create(ADirection: TDirection; ACoord: TCoordinate);
    property Direction: TDirection read FDirection;
    property Coordinate: TCoordinate read FCoordinate;
    procedure move(APath: string);
  end;

implementation

{ TRobotSimulator }

procedure TRobotSimulator.Advance;
begin
  case FDirection of
    north: FCoordinate.fY := FCoordinate.fY + 1;
    east: FCoordinate.fX := FCoordinate.fX + 1;
    south: FCoordinate.fY := FCoordinate.fY - 1;
    west: FCoordinate.fX := FCoordinate.fX - 1;
  end;
end;

constructor TRobotSimulator.Create(ADirection: TDirection; ACoord: TCoordinate);
begin
  FDirection := ADirection;
  FCoordinate := ACoord;
end;

procedure TRobotSimulator.move(APath: string);
var
  C: char;
begin
  for C in APath do
    case c of
      'L', 'l' : TurnLeft;
      'R', 'r' : TurnRight;
      'A', 'a' : Advance;
    end; //case
end;

procedure TRobotSimulator.TurnLeft;
begin
  FDirection := TDirection(((ord(FDirection) + 3)) mod 4);
end;

procedure TRobotSimulator.TurnRight;
begin
  FDirection := TDirection((ord(FDirection) + 1) mod 4);
end;

{ TCoordinate }

constructor TCoordinate.create(aX, aY: integer);
begin
  fX := aX;
  fY := aY;
end;

end.
