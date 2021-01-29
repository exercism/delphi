unit uISBNVerifier;

interface

type
  TIsbn = class
  public
    class function isValid(aInput: string): Boolean;
  end;

implementation
uses sysutils, RegularExpressions;

{ TIsbn }

class function TIsbn.isValid(aInput: string): Boolean;
var
  wrkStr: string;
  sum,
  weight,
  digit,
  i: integer;
begin
  result := false;
  wrkStr := aInput.replace('-','');

  if TRegex.IsMatch(wrkStr, '^(\d{9}[\dX])$') then
  begin
    sum := 0;
    weight := 10;
    digit := 0;
    for i := low(wrkStr) to high(wrkStr) do
    begin
      if (wrkStr[i] = 'X') and (i = 10) then
        digit := 10
      else
        digit := string.ToInteger(wrkStr[i]);
      sum := sum + (digit * weight);
      dec(weight);
    end;
    result := sum mod 11 = 0;
  end;

end;

end.
