unit uResistorColor;

interface

type
  TResistor = class
  strict private
    class var
    fColors: TArray<string>;
  public
    class function colorCode(const aColor: string): Integer;
    class property Colors: TArray<string> read fColors write fColors;
  end;

implementation

uses
  SysUtils;

class function TResistor.colorCode(const aColor: string): Integer;
begin
  raise Exception.Create('Not yet implemented');
end;

end.