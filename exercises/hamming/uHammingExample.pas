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
begin
  if strand1.IsEmpty and not strand2.IsEmpty then
    raise EArgumentException.Create('error: left strand must not be empty');

  if not strand1.IsEmpty and strand2.IsEmpty then
    raise EArgumentException.Create('error: right strand must not be empty');

  if strand1.Length <> strand2.Length  then
    raise EArgumentException.Create('error: left and right strands must be of equal length');

  result := 0;
  for var i := Low(strand1) to High(strand1) do
    result := result + ord(strand1[i] <> strand2[i]);
end;

end.
