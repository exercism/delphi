unit uMatchingBrackets;

interface

type
  TMatchingBrackets = class
  private
    class var
      fBrackets: string;
      fPreviousLength: integer;
  public
    class function IsPaired(aInput: string): boolean;
  end;

implementation
uses SysUtils;

{ TMatchingBrackets }

class function TMatchingBrackets.IsPaired(aInput: string): boolean;
var
  aChar: char;
begin
  fBrackets := '';
  for aChar in aInput do
    if aChar in ['[',']','{','}','(',')'] then
      fBrackets := fBrackets + aChar;
  fPreviousLength := length(fBrackets);

  while length(fBrackets) > 0 do
  begin
    fBrackets := fBrackets.Replace('[]', '').Replace('{}', '').Replace('()', '');
    if length(fBrackets) = fPreviousLength then
      exit(false);
    fPreviousLength := length(fBrackets);
  end;
  result := true;
end;

end.
