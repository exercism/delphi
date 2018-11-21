unit uSay;

interface

type
  TSay = class
    class function Say(AInp : Int64) : string;
  end;

implementation

uses
  System.SysUtils, System.Math;

{ TSay }

class function TSay.Say(AInp: Int64): string;

const
  Smalls : Array [0..20] of string = ('', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine', 'ten',
      'eleven', 'twelve', 'thirteen', 'fourteen', 'fifteen', 'sixteen', 'seventeen', 'eighteen', 'nineteen', 'twenty');
  Tens : Array [2..9] of string = ( 'twenty', 'thirty', 'forty', 'fifty', 'sixty', 'seventy', 'eighty', 'ninety');
  Many : Array [0..4] of string = ('', ' thousand', ' million', ' billion', ' trillion');
var
  MC: Integer;
  S, UT: string;

  function UnderHundred(Ainp : integer) : string;
  var S : string;
  begin
    if Ainp = 0 then
      exit('');
    if (Ainp > 20) then
      Result := format('%s-%s',[Tens[Ainp div 10], Smalls[Ainp mod 10]])
    else
      Result := Smalls[Ainp];
  end;

  function UnderThousand(AInp : integer) : string;
  var
    UH, Space: string;
  begin
    if AInp = 0 then
      exit('');
    UH := UnderHundred(AInp mod 100);
    if AInp < 100 then
      Result := UH
    else
    begin
      if UH <> '' then
        Space := ' ';
      Result := Format('%s hundred%s%s', [Smalls[AInp div 100], Space, UH]);
    end;
  end;

begin
  if (AInp < 0) or (AInp > 999999999999 ) then
    raise EArgumentOutOfRangeException.Create('input out of range');

  if AInp = 0 then
    Exit('zero');

  MC := 0;
  while AInp > 0 do
  begin
    S := '';
    if Result <> '' then
      S := ' ';
    UT := UnderThousand(AInp mod 1000);
    if UT <> '' then
      Result := UT + Many[MC] + S + Result;
    inc(MC);
    AInp := AInp div 1000;
  end;
end;

end.
