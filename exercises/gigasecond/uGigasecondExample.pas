unit uGigasecond;

interface

const
  CanonicalVersion = '1.1.0';

type
  TGigasecond = class
    class function Add(ABirthDate : string) : string;
  end;

implementation

uses System.DateUtils, System.SysUtils;

class function TGigasecond.Add(ABirthDate: string): string;
const
  GigaSecInDays = 1000000000 / SecsPerDay;
begin
  Result := DateToISO8601(ISO8601ToDate(ABirthDate) + GigaSecInDays).Remove(19);
end;

end.
