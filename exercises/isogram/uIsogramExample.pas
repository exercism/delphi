unit uIsogram;

interface
uses
  System.Generics.Collections;

function isIsogram(aWords: string): Boolean;

implementation
uses SysUtils;

function isIsogram(aWords: string): Boolean;
var
  Letters: TList<char>;
  lChar: char;
begin
  Letters := TList<char>.Create;
  try
    aWords := aWords.ToLowerInvariant.Replace('-', '').Replace(' ','');
    for lChar in aWords do
    begin
      if Letters.Contains(lChar) then
        exit(false)
      else
        Letters.Add(lChar);
    end;
    result := true;
  finally
    Letters.Free;
  end;
end;

end.

