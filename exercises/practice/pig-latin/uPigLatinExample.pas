unit uPigLatin;

interface

type
  TPigLatin = class
  private
    class function WordStartsWithVowelLike(aWord: string): boolean;
    class function WordStartsWithPrefixes(aWord: string; aPrefixes: array of string): boolean;
    class function WordStartsWithConsonantAndQu(aWord: string): boolean;
    class function TranslateWord(aWord: string): string;
  public
    class function Translate(aWords: string): string;
  end;

implementation
uses System.SysUtils,
     System.Generics.Collections,
     System.RegularExpressions;

{ TPigLatin }

class function TPigLatin.Translate(aWords: string): string;
var
  Words: TArray<string>;
  TranslatedWordsList: TList<string>;
  TranslatedWordsArray: TArray<string>;
  inWord: string;
begin
  Words := aWords.Split([' ']);
  TranslatedWordsList := TList<string>.create;
  for inWord in Words do
    TranslatedWordsList.Add(TranslateWord(inWord));
  TranslatedWordsArray := TranslatedWordsList.ToArray;
  result := string.Join(' ', TranslatedWordsArray);
end;

class function TPigLatin.TranslateWord(aWord: string): string;
begin
  if WordStartsWithVowelLike(aWord) then
    result := aWord + 'ay'
  else
  if WordStartsWithPrefixes(aWord, ['thr', 'sch']) then
    result :=  aword.Substring(3) + aWord.Substring(0, 3) + 'ay'
  else
  if WordStartsWithPrefixes(aWord, ['ch', 'qu', 'th', 'rh']) then
    result := aWord.Substring(2) + aWord.Substring(0, 2) + 'ay'
  else
  if WordStartsWithConsonantAndQu(aWord) then
    result := aWord.Substring(3) + aWord[1] + 'quay'
  else
    result := aWord.Substring(1) + aWord[1] + 'ay';
end;

class function TPigLatin.WordStartsWithConsonantAndQu(aWord: string): boolean;
begin
  result := aWord.Substring(1).StartsWith('qu');
end;

class function TPigLatin.WordStartsWithPrefixes(aWord: string;
  aPrefixes: array of string): boolean;
var lPrefix: string;
begin
  result := false;
  for lPrefix in aPrefixes do
  begin
    result := aWord.StartsWith(lPrefix);
    if result then
      break;
  end;
end;

class function TPigLatin.WordStartsWithVowelLike(aWord: string): boolean;
const cIgnoreCase = true;
begin
  result := TRegex.IsMatch(aWord[1],'[aeiou]',[roIgnoreCase]) or
            aWord.StartsWith('yt',cIgnoreCase) or
            aWord.StartsWith('xr',cIgnoreCase);
end;

end.
