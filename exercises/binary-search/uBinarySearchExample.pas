unit uBinarySearch;

interface

type
  TBinarySearch = class
  public
    class function Search(input: TArray<integer>; target: integer): integer; static;
    class function SearchHelper(input: TArray<integer>; target, minIndex, maxIndex: integer): integer; static;
  end;

implementation

class function TBinarySearch.Search(input: TArray<integer>; target: integer): integer;
begin
  if length(input) = 0 then
    result := -1
  else
    result := SearchHelper(input, target, 0, length(input) - 1);
end;

class function TBinarySearch.SearchHelper(input: TArray<integer>; target, minIndex, maxIndex: integer): integer;
var middleIndex: integer;
begin
  middleIndex := (minIndex + maxIndex) div 2;
  if input[middleIndex] = target then
    result := middleIndex
  else
    if (middleIndex <= 0) or (middleIndex >= length(input) - 1) then
      result := -1
    else
      if input[middleIndex] > target then
        result := SearchHelper(input, target, minIndex, middleIndex - 1)
      else
        result := SearchHelper(input, target, middleIndex + 1, maxIndex);
end;

end.
