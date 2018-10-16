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

  function CreateName : string;
  var
    i: Integer;
  begin
    for i := 0 to 1 do
      Result := Result + Char(65 + Random(26));
    Result := Result + format('%.*d', [3, Random(1000)]);
  end;

  function Encode (AVal : integer) : string;
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

  function Decode(AName: string): integer;
  begin
    Result := (Ord(AName[1]) - Ord('A')) * 26;
    Result := (Result + (Ord(AName[2]) - Ord('A'))) * 1000;
    Result := Result + AName.Remove(0, 2).ToInteger;
  end;

  function CheckOther(AName : string; ADist : integer) : string;
  var
    OtherVal: integer;
    Other: string;
  begin
    Result := '';
    OtherVal := Decode(AName) + ADist;
    Other := Encode(OtherVal);
    if (OtherVal < 676000) and not FUsedNames.Contains(Other) then
      exit(Other);
    OtherVal := Decode(AName) - ADist;
    Other := Encode(OtherVal);
    if (OtherVal > -1) and not FUsedNames.Contains(Other) then
      Result := Other;
  end;

  function FindFirstUnused(AName : string) : string;
  var Dist : integer;
    Unused : string;
  begin
    Result := '';
    Unused := AName;
    Dist := 0;
    while FUsedNames.Contains(Unused) do
    begin
      inc(Dist);
      Unused := CheckOther(AName, Dist);
    end;
    Result := Unused;
  end;

var position : integer;

begin
  FName := FindFirstUnused(CreateName);
  FUsedNames.BinarySearch(FName, position);
  FUsedNames.Insert(position, FName);
end;

initialization
  Randomize;
end.
