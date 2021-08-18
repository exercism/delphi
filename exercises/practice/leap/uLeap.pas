unit uLeap;

interface

type
  TYear = class
    class function IsLeap(aYear: integer): Boolean;
  end;

implementation

uses
  SysUtils;

class function TYear.IsLeap(aYear: integer): Boolean;
begin
  raise Exception.Create('Not yet implemented');
end;

end.