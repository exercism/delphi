unit uSay;

interface

function Say(AInp : Int64) : string;

implementation

uses
  System.SysUtils, System.Math;

{ TSay }

function Say(AInp: Int64): string;

const
  Smalls : Array [0..20] of string = ('', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine', 'ten',
      'eleven', 'twelve', 'thirteen', 'fourteen', 'fifteen', 'sixteen', 'seventeen', 'eighteen', 'nineteen', 'twenty');
  Tens : Array [2..9] of string = ( 'twenty', 'thirty', 'forty', 'fifty', 'sixty', 'seventy', 'eighty', 'ninety');
  Many : Array [0..4] of string = ('', ' thousand', ' million', ' billion', ' trillion');

  function UnderHundred(Ainp : integer) : string;
  begin
    if Ainp = 0 then
      exit('');
    if (Ainp > 20) then
      Result := format('%s-%s',[Tens[Ainp div 10], Smalls[Ainp mod 10]])
    else
      Result := Smalls[Ainp];
  end;

  function UnderThousand(AInp : integer) : string;
  begin
    if AInp = 0 then
      exit('');
    var UH := UnderHundred(AInp mod 100);
    if AInp >= 100 then
    begin
      var Space := '';
      if UH <> '' then
        Space := ' ';
      Result := Format('%s hundred%s%s', [Smalls[AInp div 100], Space, UH]);
    end
    else
      Result := UH
  end;

begin
  if (AInp < 0) or (AInp > 999999999999 ) then
    raise EArgumentOutOfRangeException.Create('input out of range');

  if AInp = 0 then
    Exit('zero');

  var MC := 0;
  while AInp > 0 do
  begin
    var S := '';
    if Result <> '' then
      S := ' ';
    var UT := UnderThousand(AInp mod 1000);
    if UT <> '' then
      Result := UT + Many[MC] + S + Result;
    inc(MC);
    AInp := AInp div 1000;
  end;
end;

end.
