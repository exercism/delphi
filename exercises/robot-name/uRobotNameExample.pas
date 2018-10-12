unit uRobotName;

interface

uses
  System.Generics.Collections;

type
  TRobot = class
  private

    FName: string;
    class var FUsedNames : TList<string>;
    class constructor Create;
    class destructor Destroy;
    procedure SetName;
  public
    constructor Create;
    property Name : string read FName;
    procedure Reset;
  end;

implementation

uses
  System.SysUtils;

{ TRobot }

class constructor TRobot.Create;
begin
  FUsedNames := TList<string>.Create;
end;

constructor TRobot.Create;
begin
  SetName;
end;

class destructor TRobot.Destroy;
begin
  FUsedNames.DisposeOf;
end;

procedure TRobot.Reset;
begin
  if FUsedNames.Contains(FName) then
    FUsedNames.Remove(FName);
  SetName;
end;

procedure TRobot.SetName;
var
  N : string;
  function CreateName : string;
  var
    i: Integer;
  begin
    Randomize;
    for i := 0 to 1 do
      Result := Result + Char(65 + Random(26));
    Result := Result + format('%.*d', [3, Random(1000)]);
  end;

begin
  repeat
    N := CreateName;
  until not FUsedNames.Contains(N);
  FUsedNames.Add(N);
  FName := N;
end;

end.
