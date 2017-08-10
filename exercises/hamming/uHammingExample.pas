unit uHamming;

interface

type
  THamming = class
  public
    class function Distance(strand1, strand2: string): integer; static;
  end;

implementation
uses System.SysUtils;

class function THamming.Distance(strand1, strand2: string): integer;
var i: integer;
begin
  if strand1.Length <> strand2.Length  then
    raise EArgumentException.Create('error: left and right strands must be of equal length');
  result := 0;
  for i := Low(strand1) to High(strand1) do
    result := result + ord(strand1[i] <> strand2[i]);
end;

end.
