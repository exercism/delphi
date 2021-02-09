unit uRaindrops;

interface

type

  Raindrops = class
    class function Convert(aNumber: integer): string; static;
  end;

implementation
uses System.SysUtils;

class function Raindrops.Convert(aNumber: integer): string;
begin
  result := '';
  if aNumber mod 3 = 0 then
    result := result + 'Pling';
  if aNumber mod 5 = 0 then
    result := result + 'Plang';
  if aNumber mod 7 = 0 then
    result := result + 'Plong';
  if result = '' then
    result := aNumber.ToString;
end;

end.
