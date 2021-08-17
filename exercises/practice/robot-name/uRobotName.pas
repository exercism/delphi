unit uRobotName;

interface

uses
  Generics.Collections;

type
  TRobot = class
  private
    class var NamesTracking: TList<string>; // global var to track names already used
    var fName: string;
  public
    class constructor Create;
    class destructor Destroy;
    procedure Reset;
    property name: string read fName write fName;
  end;

implementation

{ TRobot }

class constructor TRobot.Create;
begin

end;

class destructor TRobot.Destroy;
begin

end;

procedure TRobot.Reset;
begin

end;

end.