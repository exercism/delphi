unit uAcronym;

interface

function abbreviate(aPhrase: string): string;

implementation
uses SysUtils
     ,RegularExpressions
     ,System.Generics.Collections;

function abbreviate(aPhrase: string): string;

  function findWords(inputPhrase: string): TMatchCollection;
  begin
    result := TRegex.Matches(inputPhrase,'[A-Z]+[a-z]*|[a-z]+');
  end;

  function makeListOfWords(aMatches: TMatchCollection): TList<string>;
  var
    lMatch: TMatch;
  begin
    result := TList<string>.create;
    for lMatch in aMatches do
      if lMatch.Success then
        result.Add(lMatch.Value);
  end;

  function ExtractAndUpcaseFirstLetters(aWords: TList<string>): string;
  var
    _Word: string;
  begin
    result := '';
    for _Word in aWords do
      result := result + _Word.ToUpperInvariant[1];
  end;

begin
  result := ExtractAndUpcaseFirstLetters(makeListOfWords(findWords(aPhrase)));
end;

end.

