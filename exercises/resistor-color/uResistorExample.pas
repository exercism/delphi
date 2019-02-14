unit uResistor;

interface

type
  TResistorColors = (rcBlack, rcBrown, rcRed, rcOrange, rcYellow, rcGreen,
    rcBlue, rcViolet, rcGrey, rcWhite);

  TResistor = class
    class function colorCode(aColor: TResistorColors): integer;
    class function colors: TArray<TResistorColors>;
  end;


implementation

{ TResistor }

class function TResistor.colorCode(aColor: TResistorColors): integer;
begin
  result := ord(aColor);
end;

class function TResistor.colors: TArray<TResistorColors>;
begin
  SetLength(Result, ord(high(TResistorColors)) + 1);
  for var aColor := Low(TResistorColors) to High(TResistorColors) do
    Result[ord(aColor)] := aColor;
end;

end.
