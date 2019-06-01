unit uReverseString;

interface

function reverse(aInString: string): string;

implementation

function reverse(aInString: string): string;
begin
  result := '';
  for var character in aInString do
    result := character + result;
end;

end.
