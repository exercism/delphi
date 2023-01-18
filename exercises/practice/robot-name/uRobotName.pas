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

uses
  SysUtils;

class constructor TRobot.Create;
begin
  raise Exception.Create('Create not yet implemented');
end;

class destructor TRobot.Destroy;
begin
  raise Exception.Create('Destroy not yet implemented');
end;

procedure TRobot.Reset;
begin
  raise Exception.Create('Reset not yet implemented');
end;

end.