unit uLuhn;

interface

type
  TLuhn = class
    class function Valid(AInp : string) : boolean;
  end;

implementation

uses
  System.Regularexpressions, System.SysUtils, System.StrUtils;

{ TLuhn }

class function TLuhn.Valid(AInp: string): boolean;
var
  s : string;
  i, R, P: int64;
begin
  R := 0;
  s := ReverseString(AInp.Replace( ' ', ''));
  if (Length(s) <= 1) or (TRegEx.IsMatch(s, '\D')) then
    exit(false);
  for i := Low(s) to High(s) do
    if odd(i) then
      R := R + StrToInt(s[i])
    else
    begin
      P := StrToInt(s[i]) * 2;
      if P > 9 then
        P := P - 9;
      R := R + P;
    end;
  Result := R mod 10 = 0;
end;

end.
