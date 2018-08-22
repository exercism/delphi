unit uAnagram;

interface

type
  TAnagram = class
  private
    fSubject: string;
    function IsWordAnagramOfSubject(aWord: string): boolean;
    function IsNotTheSameWordAsSubject(aWord: string): boolean;
    function HasSameLettersAsSubject(aWord: string): boolean;
    function SortString(aInput: string): string;
  public
    constructor Create(aSubject: string);
    function findAnagram(aCandidates: TArray<string>): TArray<string>;
  end;

implementation
uses SysUtils
     ,System.Generics.Collections
     ,System.generics.defaults;


{ TAnagram }

constructor TAnagram.Create(aSubject: string);
begin
  fSubject := aSubject;
end;

function TAnagram.findAnagram(aCandidates: TArray<string>): TArray<string>;
var
  matches: TList<string>;
  _Word: string;
begin
  matches := TList<string>.create;
  for _Word in aCandidates do
    if IsWordAnagramOfSubject(_Word) then
      matches.Add(_Word);
  result := matches.ToArray;
end;

function TAnagram.HasSameLettersAsSubject(aWord: string): boolean;
var
  sortedWord: string;
  sortedSubject: string;
begin
  result := SortString(fSubject).Equals(SortString(aWord));
end;

function TAnagram.IsNotTheSameWordAsSubject(aWord: string): boolean;
var
  Comparer: TOrdinalIStringComparer;
begin
  Comparer := TOrdinalIStringComparer.Create;
  result := not Comparer.Equals(fSubject, aWord);
  Comparer.DisposeOf;
  Comparer := nil;
end;

function TAnagram.SortString(aInput: string): string;

  function CharArrayToString(const a: array of Char): string;
  begin
    if Length(a) > 0 then
      SetString(Result, PChar(@a[0]), Length(a))
    else
      Result := '';
  end;

var
  charList: TList<char>;
begin
  charList := TList<char>.create;
  charList.AddRange(aInput.ToLower.ToCharArray);
  charList.Sort;
  result := CharArrayToString(charList.ToArray);
  charList.DisposeOf;
  charList := nil;
end;

function TAnagram.IsWordAnagramOfSubject(aWord: string): boolean;
begin
  result := IsNotTheSameWordAsSubject(aWord) and HasSameLettersAsSubject(aWord);
end;

end.

