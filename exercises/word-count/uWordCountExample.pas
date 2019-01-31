unit uWordCount;

interface
uses
  System.Generics.Collections;

type
  IWordCount = interface
    ['{955DF34E-254D-44E1-B4F3-91F0DCF8B764}']
    function countWords: TDictionary<string, integer>;
  end;

  TWordCount = class(TInterfacedObject, IWordCount)
  private
    FWords: string;
    FWordDict: TDictionary<string, integer>;
  public
    constructor Create(aWords: string);
    function countWords: TDictionary<string, integer>;
  end;

function WordCount(aWords: string): IWordCount;

implementation

uses Character, SysUtils, RegularExpressions;

function WordCount(aWords: string): IWordCount;
begin
  result := TWordCount.Create(aWords);
end;

constructor TWordCount.Create(aWords: string);
begin
  inherited Create;
  FWords := aWords;
  FWordDict := TDictionary<string, integer>.Create;
end;

function TWordCount.countWords: TDictionary<string, integer>;

  function cleanWord(aWord: string): string;
  begin
    result := aWord;
    while not result[length(result)].IsLetterOrDigit and not result.IsEmpty do
      result := result.Remove(length(result)-1);
  end;

begin
  // convert to lowercase and trim spaces
  FWords := FWords.ToLowerInvariant.Trim;
  // replace all separators with spaces
  FWords := TRegEx.Replace(FWords, '(,|\\n|'' | ''|:)', ' ', [roNone]);
  // get rid of extra characters
  FWords := TRegEx.Replace(FWords, '[^0-9a-z '']', '', [roNone]);
  // delete extra spaces
  FWords := TRegEx.Replace(FWords, '\s+', ' ', [roNone]);
  FWords := FWords.Trim;
  // replace all separators with spaces
  FWords := TRegEx.Replace(FWords, '(,|\\n|'' | ''|:)', ' ', [roNone]);

  for var aWord in FWords.Split([' ']){sWords} do
  begin
    var wrkWord := cleanWord(aWord);
    if wrkWord.IsEmpty then
      continue;
    if (not FWordDict.ContainsKey(wrkWord)) then
      FWordDict.Add(wrkWord, 1)
    else
      FWordDict.Items[wrkWord] := FWordDict.Items[wrkWord] + 1;
  end;

  result := FWordDict;
end;

end.

