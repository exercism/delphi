unit uRobotName;

interface

uses
  System.Generics.Collections;

type
  TRobot = class
  private
    FIndex: integer;
    class var FUnusedNames : TList<integer>;
    class constructor Create;
    class destructor Destroy;
    class function Encode(AVal : integer) : string;
    procedure SetName;
    function GetName: string;


  public
    constructor Create;
    property Name : string read GetName;
    procedure Reset;
  end;

implementation

uses
  System.SysUtils;

{ TRobot }

class constructor TRobot.Create;
var
  I: Integer;
begin
  FUnusedNames := TList<integer>.Create;
  for I := 0 to 675999 do
    FUnusedNames.Add(i);
end;

constructor TRobot.Create;
begin
  SetName;
end;

class destructor TRobot.Destroy;
begin
  FUnusedNames.DisposeOf;
end;

class function TRobot.Encode(AVal: integer): string;
  var LP : string;
    t : integer;
begin
  if (AVal < 0) or (AVal > 675999) then
    result := '';
  t := AVal div 1000;
  LP := char(ord('A') + t div 26);
  LP := LP + char(ord('A') + t mod 26);
  Result := LP + format('%.*d', [3, AVal mod 1000]);
end;

function TRobot.GetName: string;
begin
  Result := Encode(FIndex);
end;

procedure TRobot.Reset;
var i : integer;
begin
  if not FUnusedNames.BinarySearch(FIndex, i) then
    FUnusedNames.Insert(i, FIndex);
  SetName;
end;

procedure TRobot.SetName;
var
  ind : integer;

begin
  ind := random(FUnusedNames.Count);
  FIndex := FUnusedNames.Items[ind];
  FUnusedNames.Delete(ind);
end;

initialization
  Randomize;
end.
