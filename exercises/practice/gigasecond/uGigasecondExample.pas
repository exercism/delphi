unit uGigasecond;

interface

type
  TGigasecond = class
    class function Add(AMoment : string) : string;
  end;

implementation
uses System.DateUtils, System.SysUtils;

class function TGigasecond.Add(AMoment: string): string;
const
  GigaSecInDays = 1000000000 / SecsPerDay;
begin
  Result := DateToISO8601(ISO8601ToDate(AMoment) + GigaSecInDays).Remove(19);
end;

end.
