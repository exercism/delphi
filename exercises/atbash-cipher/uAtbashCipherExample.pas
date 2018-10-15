unit uAtbashCipher;

interface

type
  TAtbashCipher = class
  private
    class function ToAtbash(AInp: string) : string;
  public
    class function Encode(AInp : string) : string;
    class function Decode(AInp : string) : string;
  end;

implementation

uses System.Character, System.SysUtils, System.RegularExpressions;

{ TAtbashCipher }

class function TAtbashCipher.Decode(AInp: string): string;
begin
  Result := ToAtbash(AInp);
end;

class function TAtbashCipher.Encode(AInp: string): string;

  function Split(AInp : string) : string;
  var
    i: Integer;
  begin
    Result := Copy(AInp, 1, 5);
    for i := 1 to length(ainp) div 5 do
      Result := Result + ' ' + Copy(AInp, i * 5 + 1, 5);
    Result := TrimRight(Result);
  end;

begin
  Result := Split(ToAtbash(AInp));
end;

class function TAtbashCipher.ToAtbash(AInp: string): string;
var
  i: Integer;
begin
  AInp := TRegEx.Replace(AInp.ToLowerInvariant, '[\s.,]', '');
  for i := low(AInp) to High(AInp) do
    if ord(Ainp[i]) in [Ord('a') .. Ord('z')] then
      Result := Result + char(Ord('a') + Ord('z') - Ord(AInp[i].ToLower))
    else
      Result := Result + Ainp[i];
end;

end.
