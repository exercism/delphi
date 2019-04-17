unit uMarkdown;

interface

type
  TMarkdown = class
    class function Parse(input: String): String;
  end;

implementation

uses
  System.Sysutils, RegularExpressions;

class function TMarkdown.Parse(input: String): String;
var
  isNormalText: Boolean;
  Lines: TArray<String>;
  i: integer;
  HeaderLevel: integer;
  ch: char;
  LiTrue: boolean;
begin
  Lines := input.Split(['\n'], TStringSplitOptions.ExcludeEmpty);

  for i := Low(Lines) to High(Lines) do
  begin
    isNormalText := True;
    while TRegEx.IsMatch(Lines[i], '\_\_(.)+\_\_') do
    begin
      Lines[i] := Lines[i].Replace('__', '<strong>', []);
      Lines[i] := Lines[i].Replace('__', '</strong>', []);
    end;
    while TRegEx.IsMatch(Lines[i], '\_(.)+\_') do
    begin
      Lines[i] := Lines[i].Replace('_', '<em>', []);
      Lines[i] := Lines[i].Replace('_', '</em>', []);
    end;
    HeaderLevel := 0;
    for ch in Lines[i] do
      if ch = '#' then
        inc(HeaderLevel)
      else
        break;
    if (HeaderLevel = 0) then
      isNormalText := true
    else
    begin
      Lines[i] := Format('<h%0:d>' + Lines[i].Remove(0, HeaderLevel).TrimLeft +
        '</h%0:d>', [HeaderLevel]);
      isNormalText := false;
    end;
    LiTrue := False;
    if Lines[i].TrimLeft.StartsWith('*') then
    begin
      LiTrue := True;
      Lines[i] := Lines[i].TrimLeft.Remove(0, 1);
      Lines[i] := '<li>' + Lines[i].Trim + '</li>';
    end;
    isNormalText := not LiTrue and isNormalText;
    if isNormalText then
      Result := Result + '<p>' + Lines[i] + '</p>'
    else
      Result := Result + Lines[i];
  end;
  Result := TRegEx.Replace(Result, '<li>.*?<\/li>(?!<li>)', '<ul>$0</ul>');
end;

end.
