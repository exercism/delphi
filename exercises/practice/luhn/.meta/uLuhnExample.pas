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
begin
  var R := 0;
  var s := ReverseString(AInp.Replace( ' ', ''));
  if (s.Length <= 1) or (TRegEx.IsMatch(s, '\D')) then
    exit(false);
  for var i := Low(s) to High(s) do
  begin
    if odd(i) then
      R := R + StrToInt(s[i])
    else
    begin
      var P := StrToInt(s[i]) * 2;
      if P > 9 then
        P := P - 9;
      R := R + P;
    end;
  end;
  Result := R mod 10 = 0;
end;

end.
