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

{ TResistor }

class function TResistor.colorCode(const aColor: string): Integer;
begin
  Result := 5;
end;

end.