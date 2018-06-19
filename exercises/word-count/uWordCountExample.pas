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

uses SysUtils, RegularExpressions;

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
var
  aWords: TArray<string>;
  aWord: string;
begin
  // convert to lowercase and trim spaces
  FWords := Trim(Lowercase(FWords));
  // replace all separators with spaces
  FWords := TRegEx.Replace(FWords, '(,|\\n|'' | ''|:)', ' ', [roNone]);
  // get rid of extra characters
  FWords := TRegEx.Replace(FWords, '[^0-9a-z '']', '', [roNone]);
  // delete extra spaces
  FWords := TRegEx.Replace(FWords, '\s+', ' ', [roNone]);
  // splitting on spaces
  aWords := FWords.Split([' ']);

  for aWord in aWords do
  begin
    if (not FWordDict.ContainsKey(aWord)) then
      FWordDict.Add(aWord, 1)
    else
      FWordDict.Items[aWord] := FWordDict.Items[aWord] + 1;
  end;

  result := FWordDict;
end;
end.

