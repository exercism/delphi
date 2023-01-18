unit uGigasecond;

interface

type
  TGigasecond = class
    class function Add(const aTime: string): string;
  end;

implementation

uses
  SysUtils;

class function TGigasecond.Add(const aTime: string): string;
begin
  raise Exception.Create('Not yet implemented');
end;

end.