unit uReverseString;

interface

function reverse(aInString: string): string;

implementation

function reverse(aInString: string): string;
var
  i: integer;
begin
  result := '';
  for i := Low(aInString) to High(aInString) do
    result := aInString[i] + result;
end;

end.
