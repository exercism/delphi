unit uHamming;

interface

type
  THamming = class
  public
    class function compute(s1, s2: string): integer; static;
  end;

implementation
uses System.SysUtils;

class function THamming.compute(s1, s2: string): integer;
var i: integer;
begin
  if s1.Length <> s2.Length  then
    raise EArgumentException.Create('Arguments are not same length');
  result := 0;
  for i := Low(s1) to High(s1) do
    result := result + ord(s1[i] <> s2[i]);
end;

end.
