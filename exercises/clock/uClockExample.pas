unit uClock;

interface

type
  Clock = Record
  strict private
    class function fltMod(x, y: double): integer; static;
  private
    hours: integer;
    minutes: integer;
  public
    constructor SetHands(aHours: integer; aMinutes: integer=0);
    function Add(minutesToAdd: integer): Clock;
    function Subtract(minutesToSubtract: integer): Clock;
    function ToString: string;
    function Equal(aClock: Clock): Boolean;
  End;

implementation
uses SysUtils, math;

constructor Clock.SetHands(aHours: Integer; aMinutes: Integer = 0);
begin
  hours := fltMod((aHours * 60 + aMinutes) / 60.0, 24);
  minutes := fltMod(aMinutes, 60);
end;

function Clock.Subtract(minutesToSubtract: integer): Clock;
begin
  result := Clock.SetHands(hours, minutes - minutesToSubtract);
end;

function Clock.Add(minutesToAdd: Integer): Clock;
begin
  result := Clock.SetHands(hours, minutes + minutesToAdd);
end;

function Clock.ToString: string;
begin
  result := format('%.2d:%.2d',[hours, minutes]);
end;

function Clock.Equal(aClock: Clock): Boolean;
begin
  result := (aClock.hours = hours) and (aClock.minutes = minutes);
end;

class function Clock.fltMod(x, y: double): integer;
var intX, intY: integer;
    tmpFloat: double;
begin
  intX := trunc(x);
  tmpFloat := x - intX;
  intY := trunc(y);
  result := trunc((intX mod intY) + tmpFloat + intY) mod intY; //Work around for lack of floating point MOD capability
end;

end.
