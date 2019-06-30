unit uPangram;

interface
uses
  System.Generics.Collections;

function isPangram(const aWords: string): Boolean;

implementation
uses SysUtils;

function isPangram(const aWords: string): Boolean;
const
  CAlphabetLength = 26;
  CFirstLetter = 'a';
  CLastLetter = 'z';
begin
  var Letters := TList<char>.Create;
  try
    for var lChar in aWords.ToLowerInvariant do
      if CharInSet(lChar, [CFirstLetter..CLastLetter]) and not Letters.Contains(lChar) then
        Letters.Add(lChar);
    result := Letters.Count = CAlphabetLength;
  finally
    Letters.Free;
  end;
end;

end.

