unit uRomanNumerals;

interface

type
  RomanNumeralHelper = record helper for integer
  public
    function ToRoman: string;
  end;

implementation
uses System.Generics.Collections;

function RomanNumeralHelper.ToRoman: string;
var ArabicToRomanConversions: TList<TPair<integer, string>>;
    conversion: TPair<integer, string>;
    lInt: integer;
begin
  result := '';
  lInt := self;
  ArabicToRomanConversions := TList<TPair<integer, string>>.create;
  with ArabicToRomanConversions do
  begin
    Add(TPair<integer, string>.Create(1000, 'M'));
    Add(TPair<integer, string>.Create(900,  'CM'));
    Add(TPair<integer, string>.Create(500,  'D'));
    Add(TPair<integer, string>.Create(400,  'CD'));
    Add(TPair<integer, string>.Create(100,  'C'));
    Add(TPair<integer, string>.Create(90,   'XC'));
    Add(TPair<integer, string>.Create(50,   'L'));
    Add(TPair<integer, string>.Create(40,   'XL'));
    Add(TPair<integer, string>.Create(10,   'X'));
    Add(TPair<integer, string>.Create(9,    'IX'));
    Add(TPair<integer, string>.Create(5,    'V'));
    Add(TPair<integer, string>.Create(4,    'IV'));
    Add(TPair<integer, string>.Create(1,    'I'));
  end;

  for conversion in ArabicToRomanConversions do
  begin
    while (lInt div conversion.Key) > 0 do
    begin
      lInt := lInt - conversion.Key;
      result := result + conversion.Value;
    end;
  end;
end;

end.
