unit uHamming;

interface

type
  THamming = class
  public
    class function Distance(const aFirst, aSecond: string): Integer;
  end;

implementation

uses
  SysUtils;

class function THamming.Distance(const aFirst, aSecond: string): Integer;
begin
  raise Exception.Create('Not yet implemented');
end;

end.