unit uGrains;

interface

type
  Grains = class
  public
    class function Square(aValue: Integer): UInt64;
    class function Total: UInt64;
  end;

implementation

uses
  SysUtils;

class function Grains.Square(aValue: Integer): UInt64;
begin
  raise Exception.Create('Not yet implemented');
end;

class function Grains.Total: UInt64;
begin
  raise Exception.Create('Not yet implemented');
end;

end.
