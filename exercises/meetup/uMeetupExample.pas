unit uMeetup;

interface

type

  TWeekDescriptor = (Last = -1, First = 1, Second = 8, Teenth = 13, Third = 15, Fourth = 22);

  TWeekDay = (Saturday, Sunday, Monday, Tuesday, Wednesday, Thursday, Friday );

  TMeetup = class
    class function Meetup(AYear, AMonth : integer; AWeek : TWeekDescriptor; ADay : TWeekDay): string;
  end;

implementation

uses
  System.SysUtils, System.DateUtils, System.Math;

{ TMeetup }

class function TMeetup.Meetup(AYear, AMonth: integer; AWeek: TWeekDescriptor;
  ADay: TWeekDay): string;
var
  Orig, Start, Direction, Delta: integer;
begin
  Start := ord(AWeek);
  Direction := Sign(Start);
  if Start = -1 then
    Start := DayOfTheMonth(EndOfAMonth(AYear, AMonth));
  Orig := DayOfWeek(EncodeDate(AYear, AMonth, Start));
  Delta := Direction * (7 + Direction * (ord(ADay) - Orig)) mod 7;
  DateTimeToString(Result, 'yyyy-mm-dd', EncodeDate(AYear, AMonth, Start + Delta));
end;

end.
