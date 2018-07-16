unit uPangram;

interface
uses
  System.Generics.Collections;

function isPangram(aWords: string): Boolean;

implementation
uses SysUtils;

function isPangram(aWords: string): Boolean;
const
  CAlphabetLength = 26;
  CFirstLetter = 'a';
  CLastLetter = 'z';
var
  Letters: TList<char>;
  lChar: char;
begin
  result := false;
  Letters := TList<char>.Create;
  Letters.Clear;
  try
    for lChar in aWords.ToLowerInvariant do
      if (lChar in [CFirstLetter..CLastLetter]) and not Letters.Contains(lChar) then
        Letters.Add(lChar);
    result := Letters.Count = CAlphabetLength;
  finally
    Letters.Free;
  end;
end;

end.

